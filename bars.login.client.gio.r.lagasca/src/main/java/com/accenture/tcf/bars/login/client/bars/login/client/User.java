package com.accenture.tcf.bars.login.client.bars.login.client;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;	

@Data
@NoArgsConstructor
public class User {
	
	private int id;
	private String username;
    private String password;
    private String  role;
    private int port;
    

}
