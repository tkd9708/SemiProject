/**
 * 
 */
function select(addr) {
	//부모창의 주소있는곳에 보낸다
	opener.memberform.address.value=addr;
	//디테일주소를 쓸수 있게 포커스
	opener.memberform.addrdetail.focus();
	//현재창닫기
	window.close();
}
