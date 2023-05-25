/**
 * 
 */
class MyInfoJs {
	constructor() {
		this.buttonUpdate = document.getElementById("userUpdate");
		this.buttonCoupons = document.getElementById("coupons");
		this.buttonReservations = document.getElementById("reservations");
		this.buttonQandA = document.getElementById("qandA");


		this.userInfoDiv = document.getElementById("myInfoDiv");

		this.buttonUpdate.addEventListener("click", this.createUserUpdateForm.bind(this));
		this.buttonCoupons.addEventListener("click", this.createCouponListForm.bind(this));
		this.buttonReservations.addEventListener("click", this.createReservationListForm.bind(this));
		this.buttonQandA.addEventListener("click", this.createQnAListForm.bind(this));

	}

	createUserUpdateForm() {
		while (this.userInfoDiv.firstChild) {
			this.userInfoDiv.removeChild(this.userInfoDiv.firstChild);
		};

		fetch("/api/myInfo", {
			method: "GET"
		})
			.then(async (response) => {
				let data = await response.json(); // 결과 값
				
				const formTag = document.createElement("form");
				formTag.action = "/myPageProc";
				formTag.method = "POST";
				
				// 이메일
				const emailSpanTag = document.createElement("span");
				emailSpanTag.textContent = "이메일: ";

				const divEmailTag = document.createElement("div");
				const inputEmailTag = document.createElement("input");
				inputEmailTag.name = "email";
				inputEmailTag.type = "email";
				inputEmailTag.readOnly = true;
				divEmailTag.append(emailSpanTag);
				divEmailTag.append(inputEmailTag);
				inputEmailTag.value = data.email;

				// 비밀번호
				const passwordSpanTag = document.createElement("span");
				passwordSpanTag.textContent = "비밀번호: ";

				const divPasswordTag = document.createElement("div");
				const inputPasswordTag = document.createElement("input");
				inputPasswordTag.name = "password";
				inputPasswordTag.type = "password";
				divPasswordTag.append(passwordSpanTag);
				divPasswordTag.append(inputPasswordTag);
				inputPasswordTag.value = data.password;

				// 이름
				const nameSpanTag = document.createElement("span");
				nameSpanTag.textContent = "이름: ";

				const divNameTag = document.createElement("div");
				const inputNameTag = document.createElement("input");
				inputNameTag.name = "name";
				inputNameTag.type = "text";
				divNameTag.append(nameSpanTag);
				divNameTag.append(inputNameTag);
				inputNameTag.value = data.name;

				// 성별
				const genderSpanTag = document.createElement("span");
				genderSpanTag.textContent = "성별: ";

				const divGenderTag = document.createElement("div");
				const inputGenderTag = document.createElement("input");
				inputGenderTag.name = "gender";
				inputGenderTag.type = "text";
				divGenderTag.append(genderSpanTag);
				divGenderTag.append(inputGenderTag);
				inputGenderTag.value = data.gender;

				// 생년월일
				const birthSpanTag = document.createElement("span");
				birthSpanTag.textContent = "생년월일: ";

				const divBirthTag = document.createElement("div");
				const inputBirthTag = document.createElement("input");
				inputBirthTag.name = "birth";
				inputBirthTag.type = "text";
				inputBirthTag.id = "text";
				inputBirthTag.readOnly = true;
				divBirthTag.append(birthSpanTag);
				divBirthTag.append(inputBirthTag);
				inputBirthTag.value = data.birth;

				// 전화번호
				const telSpanTag = document.createElement("span");
				telSpanTag.textContent = "전화번호: ";

				const divTelTag = document.createElement("div");
				const inputTelTag = document.createElement("input");
				inputTelTag.name = "tel";
				inputTelTag.type = "text";
				divTelTag.append(telSpanTag);
				divTelTag.append(inputTelTag);
				inputTelTag.value = data.tel;
				
				// input submit
				const inputBtnTag = document.createElement("input");
				inputBtnTag.type = "submit";
				inputBtnTag.value = "정보 수정";


				const childNodeArray = [
					divEmailTag, divPasswordTag, divNameTag, divGenderTag, divBirthTag, divTelTag, inputBtnTag
				];

				childNodeArray.forEach((node) => {
					formTag.append(node);
				});
					this.userInfoDiv.append(formTag);
			});
	};

	createCouponListForm() {
		while (this.userInfoDiv.firstChild) {
			this.userInfoDiv.removeChild(this.userInfoDiv.firstChild);
		};

		fetch("/api/myCoupon", {
			method: "GET"
		}).then(async (response) => {
			let data = await response.json();
			
			
			// 세션 값 넘어감
			/*const iframeTag = document.createElement("iframe");
			iframeTag.setAttribute("src", "/myPage");
			this.userInfoDiv.append(iframeTag);*/
			this.buttonCoupons.textContent = `쿠폰함(${data.length})`;
			for (let i = 0; i < data.length; i++) {
				const couponDivTag = document.createElement("div");
				const nameDivTag = document.createElement("div");
				const contentDivTag = document.createElement("div");
				const startDateDivTag = document.createElement("div");
				const endDateDivTag = document.createElement("div");

				nameDivTag.textContent = data[i].couponInfo.name;
				contentDivTag.textContent = data[i].couponInfo.content;
				startDateDivTag.textContent = data[i].startDate;
				endDateDivTag.textContent = data[i].endDate;

				const childNodeArry = [nameDivTag, contentDivTag, startDateDivTag, endDateDivTag];

				childNodeArry.forEach((node) => {
					couponDivTag.append(node);
				});
				this.userInfoDiv.append(couponDivTag);
			};
		});
	};

	createReservationListForm() {
		while (this.userInfoDiv.firstChild) {
			this.userInfoDiv.removeChild(this.userInfoDiv.firstChild);
		};

		fetch("/api/myReservation", {
			method: "GET"
		}).then(async (response) => {
			let data = await response.json();

			const tableTag = document.createElement("table");
			const reservationTrTag = document.createElement("tr");
			const titleStartDateTdTag = document.createElement("td");
			const titleEndDateTdTag = document.createElement("td");
			const titleRoomNameTdTag = document.createElement("td");
			const titleNumberOfPTdTag = document.createElement("td");
			const titleTotalPriceTdTag = document.createElement("td");
			const titleCreatedAtTdTag = document.createElement("td");
			titleStartDateTdTag.textContent = "체크인";
			titleEndDateTdTag.textContent = "체크아웃";
			titleRoomNameTdTag.textContent = "룸 / 패키지 명";
			titleNumberOfPTdTag.textContent = "인원";
			titleTotalPriceTdTag.textContent = "총 가격";
			titleCreatedAtTdTag.textContent = "결제일";
			const childNodeArry = [titleStartDateTdTag, titleEndDateTdTag, titleRoomNameTdTag,
				titleNumberOfPTdTag, titleTotalPriceTdTag, titleCreatedAtTdTag];

			childNodeArry.forEach((node) => {
				reservationTrTag.append(node);
			});
			
			tableTag.append(reservationTrTag);
			
			this.userInfoDiv.append(tableTag);
			
			for (let i = 0; i < data.length; i++) {
				// 예약한 날짜 format
				let createdAt = data[i].createdAt.split("T");
				
				const reservationTrTag = document.createElement("tr");
				const startDateTdTag = document.createElement("td");
				const endDateTdTag = document.createElement("td");
				const roomNameTdTag = document.createElement("td");
				const numberOfPTdTag = document.createElement("td");
				const totalPriceTdTag = document.createElement("td");
				const createdAtTdTag = document.createElement("td");
				if (data[i].room != null) {
					startDateTdTag.textContent = data[i].startDate;
					endDateTdTag.textContent = data[i].endDate;
					roomNameTdTag.textContent = data[i].room.roomType.name;
					numberOfPTdTag.textContent = data[i].numberOfP;
					totalPriceTdTag.textContent = data[i].totalPrice;
					createdAtTdTag.textContent = createdAt[0];
				} else {
					startDateTdTag.textContent = data[i].startDate;
					endDateTdTag.textContent = data[i].endDate;
					roomNameTdTag.textContent = data[i].h_package.name;
					numberOfPTdTag.textContent = data[i].numberOfP;
					totalPriceTdTag.textContent = data[i].totalPrice;
					createdAtTdTag.textContent = createdAt[0];
				}
				
				const childNodeArry = [startDateTdTag, endDateTdTag, roomNameTdTag,
				numberOfPTdTag, totalPriceTdTag, createdAtTdTag];
				
				childNodeArry.forEach((node) => {
					reservationTrTag.append(node);
				});
				
				tableTag.append(reservationTrTag);
				
				this.userInfoDiv.append(tableTag);
			};
		});
	};
	
		createQnAListForm() {
		while (this.userInfoDiv.firstChild) {
			this.userInfoDiv.removeChild(this.userInfoDiv.firstChild);
		};

		fetch("/api/myReply", {
			method: "GET"
		}).then(async (response) => {
			let data = await response.json();
			console.log(data);
			for(let i = 0; i < data.length; i++) {
				let createdAt = data[i].question.createdAt.split("T");
				const questionDivTag = document.createElement("div");
				const titleDivTag = document.createElement("div");
				const contentDivTag = document.createElement("div");
				const replyContentDivTag = document.createElement("div");
				const createdAtDivTag = document.createElement("div");
				const toggleButtonTag = document.createElement("button");

				titleDivTag.textContent = data[i].question.title;
				contentDivTag.innerHTML = data[i].question.content;
				contentDivTag.className = "hidden";
				replyContentDivTag.textContent = data[i].content;
				replyContentDivTag.className = "hidden";
				createdAtDivTag.textContent = createdAt[0];
				toggleButtonTag.name = "toggleBtn";
				toggleButtonTag.className = "toggleBtn";
				toggleButtonTag.setAttribute("id", "toggleBtn" + i);
				toggleButtonTag.textContent = "toggleBtn";

				const childNodeArry = [titleDivTag, createdAtDivTag, toggleButtonTag, contentDivTag, replyContentDivTag];

				childNodeArry.forEach((node) => {
					questionDivTag.append(node);
				});
				this.userInfoDiv.append(questionDivTag);
				
				
				let el = document.getElementById("toggleBtn" + i);
				
				el.addEventListener('click', function() {
					replyContentDivTag.classList.toggle('hidden');
					contentDivTag.classList.toggle('hidden');
				});
			};
		});
	};
}

class UserInfoUpdateDto {
	constructor(email, password, name, gender, birth, tel) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.tel = tel;
	};

	ToJson() {
		let object = {
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

class CouponDto {
	constructor(id, name, content, startDate, endDate) {
		this.id = id;
		this.name = name;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
	};

	ToJson() {
		let object = {
			id: this.id,
			name: this.name,
			content: this.content,
			startDate: this.startDate,
			endDate: this.endDate,
		};
		return JSON.stringify(object);
	}
}

class ReservationDto {
	constructor(id, startDate, endDate, numberOfP, totalPrice, room, createdAt) {
		this.id = id;
		this.numberOfP = numberOfP;
		this.totalPrice = totalPrice;
		this.startDate = startDate;
		this.endDate = endDate;
		this.room = room;
		this.createdAt = createdAt;
	};

	ToJson() {
		let object = {
			id: this.id,
			numberOfP: this.numberOfP,
			totalPrice: this.totalPrice,
			startDate: this.startDate,
			endDate: this.endDate,
			room: this.room,
			createdAt: this.createdAt
		};
		return JSON.stringify(object);
	}
}

class ReplyDto {
	constructor(id, content, question, manager) {
		this.id = id;
		this.content = content;
		this.question = question;
		this.manager = manager;
	};

	ToJson() {
		let object = {
			id: this.id,
			content: this.content,
			question: this.question,
			manager: this.manager
		};
		return JSON.stringify(object);
	}
}

new MyInfoJs();