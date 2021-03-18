pragma solidity ^0.4.18;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfProducts; // 총 제품의 수입니다. 음수가 없는 정수
    address contractOwner;	//address 전자 지갑 주소를 저장
	
    struct myStruct {
        uint   number;
        string productName;
        string location;
        uint timestamp;
    }

    myStruct[] public productes;

    constructor() public {        
        contractOwner = msg.sender;	//스마트컨트랙 배포자 주소
    }

    function addProStru (uint _initNumber, string _firstString, string _secondString) public {
        productes.push(myStruct(_initNumber,_firstString,_secondString, now)) -1;
        numberOfProducts++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfProducts() public constant returns(uint8) {
        return numberOfProducts;
    }
    
    function getAllproducts() public view returns (myStruct[]) {
        return productes;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getProductStruct(uint _index) public view returns (uint, string, string, uint) {
        return (productes[_index].number, productes[_index].productName, productes[_index].location, productes[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}