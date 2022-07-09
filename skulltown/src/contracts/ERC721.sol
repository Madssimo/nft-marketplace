// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;


/*

    Crear fncion para mintear
    1. NFT debe apuntar a una direccion 
    2. Mantener registro de los id de los tokens 
    3. Mentener registro del dueno (direccion) del token id
    4. Cuantos tokens tiene un dueno (direccion)
    5. Crear un evento que emita un registro de transferencia - direccion del contrato, deonde se mintea, el id

*/

contract ERC721 {

    event Transfer (
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    mapping(uint256 => address) private _tokenOwner;

    mapping(address => uint256) private _ownedTokensCount;

    function balanceOf(address _owner) public view returns (uint256){

        require(_owner != address(0), 'Address is zero');
        return _ownedTokensCount[_owner];

    }

    function ownerOf(uint256 _tokenId) external view returns (address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'Address is zero');
        return owner;

    }

    function _exists(uint256 tokenId) internal view returns(bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        
        //revisar que el address no sea 0
        require(to != address(0), 'ERC721 minting to zero address');

        //tokenId no debe existir anteriromente
        require(!_exists(tokenId), 'ERC721 already exists');
       
        //apuntar a direccion de dueno
        _tokenOwner[tokenId] = to;
        
       //apuntar a tokens tiene ese dueno 
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

}