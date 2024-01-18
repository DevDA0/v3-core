// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

/// @title Minimal LSP7 interface for Pinkswap
/// @notice Contains a subset of the full LSP7 interface that is used in Pinkswap V3
interface ILSP7Minimal {
    /// @notice Returns the balance of a token
    /// @param account The account for which to look up the number of tokens it has, i.e. its balance
    /// @return The number of tokens held by the account
    function balanceOf(address account) external view returns (uint256);

    /// @notice Transfers amount of tokens from from to to. The force parameter will be used when notifying the token sender and receiver and revert.
    /// @param from the sending address
    /// @param to the receiving address
    /// @param amount the amount of tokens to transfer
    /// @param force when set to TRUE, to may be any address; when set to FALSE to must be a contract that supports LSP1 UniversalReceiver and not revert
    /// @param data additional data the caller wants included in the emitted event, and sent in the hooks to from and to addresse
    function transfer(address from, address to, uint256 amount, bool force, bytes memory data) external;

    /// @notice Returns the current allowance given to a spender by an owner
    /// @param tokenOwner The account of the token owner
    /// @param operator The account of the token spender
    /// @return The current allowance granted by `owner` to `spender`
    function authorizedAmountFor(address operator, address tokenOwner) external view returns (uint256);

    /// @notice Sets the allowance of an operator from the `msg.sender` to the value `amount`
    /// @param operator the address to authorize as an operator
    /// @param amount the amount of tokens operator has access to
    /// @param operatorNotificationData the data to send when notifying the operator via LSP1
    function authorizeOperator(address operator, uint256 amount, bytes memory operatorNotificationData) external;

    /// @dev Emitted when the `from` transferred successfully `amount` of tokens to `to`.
    /// @param operator The address of the operator that executed the transfer.
    /// @param from The address which tokens were sent from (balance decreased by `-amount`).
    /// @param to The address that received the tokens (balance increased by `+amount`).
    /// @param amount The amount of tokens transferred.
    /// @param force if the transferred enforced the `to` recipient address to be a contract that implements the LSP1 standard or not.
    /// @param data Any additional data included by the caller during the transfer, and sent in the LSP1 hooks to the `from` and `to` addresses.
    event Transfer(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 amount,
        bool force,
        bytes data
    );
    
    /// @dev Emitted when `tokenOwner` enables `operator` for `amount` tokens.
    /// @param operator The address authorized as an operator
    /// @param tokenOwner The token owner
    /// @param amount The amount of tokens `operator` address has access to from `tokenOwner`
    /// @param operatorNotificationData The data to notify the operator about via LSP1.
    event OperatorAuthorizationChanged(
        address indexed operator,
        address indexed tokenOwner,
        uint256 indexed amount,
        bytes operatorNotificationData
    );
}
