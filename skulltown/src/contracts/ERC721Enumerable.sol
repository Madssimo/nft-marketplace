// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import './ERC721.sol';

contract ERC721Enumerable is ERC721 {

    uint256[] private _allTokens;
    
    mapping(uint256 => uint256) private _allTokensIndex;

    mapping(address => uint256[]) private _ownedTokens;

    mapping(uint256 => uint256) private _ownedTokensIndex;

   //function tokenByIndex(uint256 _index) external view returns (uint256);

   //function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256)

   function _mint(address to, uint256 tokenId) internal override(ERC721){
    super._mint(to, tokenId);
    //A. Agregar tokens al dueno
    _addTokensToOwnerEnumeration(to, tokenId);

    //B. Agregar tokens al totalSupply
    _addTokensToAllTokenEnumaration(tokenId);
   }

   function _addTokensToAllTokenEnumaration(uint256 tokenId) private {
    _allTokensIndex[tokenId] = _allTokens.length;
    _allTokens.push(tokenId);
   }

   function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {

    _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
    _ownedTokens[to].push(tokenId);

   }

   //Retornar token por indice

   function tokenByIndex(uint256 index) public view returns(uint256){
    require(index < totalSupply(), 'Global index out of bound');
    return _allTokens[index];
   }

      function tokenOfOwnerByIndex(address owner, uint256 index) public view returns(uint256){
    require(index < balanceOf(owner), 'Owner index out of bound');
    return _ownedTokens[owner][index];
   }

       function totalSupply() public view returns (uint256){
    return _allTokens.length;
   }


}