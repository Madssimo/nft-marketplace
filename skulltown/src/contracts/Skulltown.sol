// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;
import './ERC721Connector.sol';

contract Skulltown is ERC721Connector {

    //matriz para guardar nuestros nfts
    string[] public SkulltownNFTS;

    mapping(string => bool) _skulltownNFTExists; 

    function mint(string memory _skulltown) public {

        require(!_skulltownNFTExists[_skulltown], 'Error - token already exists');

        SkulltownNFTS.push(_skulltown);
        uint _id = SkulltownNFTS.length -1;

        _mint(msg.sender, _id);

        _skulltownNFTExists[_skulltown] = true;
    }


    constructor() ERC721Connector('Skulltown', 'SKLLT') {}
}