;; title: birthday-gift-nfts
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

;; Birthday Gift NFTs
;; Mint NFTs for birthdays with custom messages





(define-non-fungible-token birthday-gift uint)

(define-data-var last-token-id uint u0)
(define-map token-messages
    uint
    (string-ascii 100)
)

;; Mint a Birthday Gift NFT with a custom message
(define-public (mint-birthday-gift
        (recipient principal)
        (message (string-ascii 100))
    )
    (let ((new-id (+ (var-get last-token-id) u1)))
        (try! (nft-mint? birthday-gift new-id recipient))
        (map-set token-messages new-id message)
        (var-set last-token-id new-id)
        (ok {
            token-id: new-id,
            owner: recipient,
            message: message,
        })
    )
)

;; View the message of a specific Birthday Gift NFT
(define-read-only (get-birthday-message (token-id uint))
    (ok (map-get? token-messages token-id))
)
