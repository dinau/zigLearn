// zig-0.9.0 2021/12
// avr-led/src/main.zig
// Refered from https://github.com/dinau/zig-avr-testbed
pub const DDRB = @intToPtr(*volatile u8, 0x24);
pub const PORTB = @intToPtr(*volatile u8, 0x25);
pub const TCNT1 = @intToPtr(*volatile u16, 0x84);
pub const TCCR1A = @intToPtr(*volatile u8, 0x80);
pub const TCCR1B = @intToPtr(*volatile u8, 0x81);
pub const TIMSK1 = @intToPtr(*volatile u8, 0x6f);
fn BV(comptime b: u3) u8 { return (1 << b); }
const one_second = 53974;
const LED_PIN: u8 = 5;
const LED_BIT: u8 = 1 << LED_PIN;

export fn __vector_13() callconv(.Signal) void {
    PORTB.* ^= LED_BIT;
    TCNT1.* = one_second;
}

export fn main() noreturn {
    DDRB.* |= LED_BIT;
    TCNT1.* = one_second;
    TCCR1A.* = 0;
    TCCR1B.* = BV(0) | BV(2);   // clock select: clkio/1024
    TIMSK1.* = BV(0);           // Interrupt on overflow enable
    asm volatile("sei");
    while (true) {}
}
