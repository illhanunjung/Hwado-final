package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class ORDERS {
	
	private int order_seq;
	@NonNull
	private String user_email;
	@NonNull
	private int total_amount;
	private int discount_amount;
	@NonNull
	private int pay_amount;
	private String pay_method;
	@NonNull
	private int paid_amount;
	private String delivery_status;
	@NonNull
	private int basket_seq;
	@NonNull
	private String delivery_addr;
	@NonNull
	private String receiver_name;
	@NonNull
	private String receiver_phone;
	@NonNull
	private String delivery_msg;
	private String delivery_at;

}
