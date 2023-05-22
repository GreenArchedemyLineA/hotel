/**
 * 
 */
class MyInfoJs{
	constructor(){
		this.buttonUpdate = document.getElementById("userUpdate");
		this.buttonCoupons = document.getElementById("coupons");
		this.buttonReservations = document.getElementById("reservations");
		this.buttonqandA = document.getElementById("qandA");
		
		
		this.userInfoDiv = document.getElementById("userInfo");
		console.log(this.userInfoDiv)
		
		this.buttonUpdate.addEventListener("click", this.createUserUpdateForm.bind(this))
		
		
	}
	
	createUserUpdateForm(){
		console.log(this.userInfoDiv)
		while(this.userInfoDiv.firstChild){
			this.userInfoDiv.removeChild(this.userInfoDiv.firstChild);
		}
		
		fetch("/api/userInfo",{
			method: "GET"
		})
		.then(async (response) => {
			let data = await response.json(); // 결과 값
			
			const divIdTag = document.createElement("input");
			divIdTag.name = "id";
			divIdTag.type = "text";
			divIdTag.readOnly = true;
	
			const divEmailTag = document.createElement("div");
			const divPasswordTag = document.createElement("div");
			const divNameTag = document.createElement("div");
			const divGenderTag = document.createElement("div");
			const divBirthTag = document.createElement("div");
			const divtelTag = document.createElement("div");
			
			divIdTag.value = "아이디:" + data.id;
			divEmailTag.textContent = "이메일:" + data.email;
			divPasswordTag.textContent = "비번:" +  data.password;
			divNameTag.textContent = "이름:" +  data.name;
			divGenderTag.textContent = "성별:" +  data.gender;
			divBirthTag.textContent = "생년월일:" +  data.birth;
			divtelTag.textContent = "전화번호:" + data.tel;
			
			
			const childNodeArray = [
				divIdTag, divEmailTag, divPasswordTag, divNameTag, divGenderTag, divBirthTag, divtelTag
				]
				
			childNodeArray.forEach((node)=>{
				this.userInfoDiv.append(node);
			})
		})
		
		
		
	}
}
/*
		private Integer id;
		private String email;
		private String password;
		private String name;
		private String gender;
		private Date birth;
		private String tel;
*/

class UserInfoUpdateDto{
	constructor(email, password, name, gender, birth, tel){
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.tel = tel;
	};
	
	ToJson(){
		let object ={
			email: this.email,	
			password: this.password,	
			name: this.name,	
			gender: this.gender,	
			birth: this.birth,	
			tel: this.tel,	
		};
		return JSON.stringify(object);
	}
}

new MyInfoJs();