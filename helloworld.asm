data segment data
    string db 'Hello World!',0dh,0ah,'$'
data ends
code segment code
    assume cs:csseg,ds:dsseg
start:
    mov ax,data
    mov ds,ax
    mov dx,offset string
    mov ah,09
    int 21h
    mov ax,4c00h
    int 21h
code ends
end start
