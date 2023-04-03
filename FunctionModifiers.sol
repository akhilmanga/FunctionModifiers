// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract FunctionModifiers {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
      paused = _paused;
    }

    modifier whenNotPaused() {
       require(!paused, "paused");
       _;
    }

    function inc() external whenNotPaused {
        count += 2;
    }

    function dec() external whenNotPaused {
            count -= 2;
    }

    modifier cap(uint _x) {
       require(_x < 100, "_x > 100");
       _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
           count += _x;
    }


    modifier sandwich() {
        // code
        count += 4;
        _;
        // more code 
        count *= 5;
    }

    function foo() external sandwich {
        count += 6;
    }
 }