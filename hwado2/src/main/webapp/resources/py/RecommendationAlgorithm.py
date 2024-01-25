from flask import * 
import numpy as np
import tensorflow as tf
from tensorflow.keras.applications import VGG16
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.vgg16 import preprocess_input
from sklearn.metrics.pairwise import cosine_similarity
import os

# 이미지 경로 설정
image_directory = "C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hwado2/resources/artworks"

# 이미지를 VGG16을 사용하여 특징 벡터로 변환하는 함수
def extract_features(img_path, model):
    img = image.load_img(img_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array = preprocess_input(img_array)
    features = model.predict(img_array)
    return features.flatten()

# 모든 이미지의 특징 벡터 추출
def extract_all_features(directory, model):
    image_files = [f for f in os.listdir(directory) if f.endswith(('.jpg', '.png'))]
    features = []
    for img_file in image_files:
        img_path = os.path.join(directory, img_file)
        img_features = extract_features(img_path, model)
        features.append(img_features)
    return np.array(features)

# 주어진 이미지와 가장 유사한 이미지 찾기
def find_similar_images(query_image_features, all_image_features, top_k=4):
    similarities = cosine_similarity([query_image_features], all_image_features)
    similar_image_indices = np.argsort(similarities[0])[::-1][:top_k]
    return similar_image_indices


# 이미지의 특징과 이름을 추출하는 함수
def extract_all_features(directory, model):
    all_features = []
    for image_path in os.listdir(directory):
        full_path = os.path.join(directory, image_path)
        features = extract_features(full_path, model)
        all_features.append((features, image_path))  # 특징과 이미지 이름 저장
    return all_features

app = Flask(__name__)

# Flask 앱 컨텍스트 내에서 VGG16 모델 로드 및 모든 이미지의 특징 추출
with app.app_context():
    base_model = VGG16(weights='imagenet', include_top=False)
    image_directory = "C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hwado2/resources/artworks"
    all_image_features = extract_all_features(image_directory, base_model)

@app.route('/get_similar_images', methods=['POST'])
def get_similar_images():
    try:
        # Java로부터 이미지 경로 수신
        data = request.data.decode('utf-8')  # 데이터를 UTF-8로 디코딩
        data = json.loads(data)  # JSON으로 파싱
        query_image_path = data['query_image_path']

        # 특징 추출 및 유사한 이미지 검색
        query_image_features = extract_features(query_image_path, base_model)
        similar_image_indices = find_similar_images(query_image_features, [features for features, _ in all_image_features], top_k=20)

        # 유사한 이미지의 이름 찾기
        similar_image_names = [all_image_features[index][1] for index in similar_image_indices]

        # 응답 데이터 준비
        response_data = {
            'similar_image_names': similar_image_names,
        }

        return jsonify(response_data)

    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    # Flask 앱 실행
    app.run(host='211.227.224.159', port=9001)