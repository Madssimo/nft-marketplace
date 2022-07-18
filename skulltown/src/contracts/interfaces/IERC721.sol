// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

interface IERC721 {
        event Transfer (
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 indexed _tokenId
    );
}