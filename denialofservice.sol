pragma solidity ^0.5.17;



contract KingOfEther {
    address public king;
    uint public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent, ) = king.call.value(balance)("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}
