library ieee; 
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;
entity Rom_Histograma_triangle is
	generic(
	n: 	integer:= 12;		-- No. de bits informacion
	m:	integer:= 9 		-- No. de bits para datos
	); 
	port 
	(
		CLK		: in std_logic;
		addr	: in std_logic_vector (m-1 downto 0);
		q		: out std_logic_vector((n -1) downto 0)
	);
end Rom_Histograma_triangle;
architecture rtl of Rom_Histograma_triangle is
	subtype word_t is std_logic_vector((n-1) downto 0);
	type memory_t is array(0 to (2**m)-1 ) of word_t;
	function init_rom
		return memory_t is 
		variable tmp : memory_t :=(
	 "100011100011",  	 --  2275 	 0 
	 "100100011101",  	 --  2333 	 1 
	 "100101010111",  	 --  2391 	 2 
	 "100110010001",  	 --  2449 	 3 
	 "100111001011",  	 --  2507 	 4 
	 "101000000101",  	 --  2565 	 5 
	 "101000111111",  	 --  2623 	 6 
	 "101001111001",  	 --  2681 	 7 
	 "101010110010",  	 --  2738 	 8 
	 "101011101100",  	 --  2796 	 9 
	 "101100100110",  	 --  2854 	 10 
	 "101101100000",  	 --  2912 	 11 
	 "101110011010",  	 --  2970 	 12 
	 "101111010100",  	 --  3028 	 13 
	 "110000001110",  	 --  3086 	 14 
	 "110001001000",  	 --  3144 	 15 
	 "110010000010",  	 --  3202 	 16 
	 "110010111100",  	 --  3260 	 17 
	 "110011110110",  	 --  3318 	 18 
	 "110100110000",  	 --  3376 	 19 
	 "110101101010",  	 --  3434 	 20 
	 "110110100100",  	 --  3492 	 21 
	 "110111011110",  	 --  3550 	 22 
	 "111000010111",  	 --  3607 	 23 
	 "111001010001",  	 --  3665 	 24 
	 "111010001011",  	 --  3723 	 25 
	 "111011000101",  	 --  3781 	 26 
	 "111011111111",  	 --  3839 	 27 
	 "111100111001",  	 --  3897 	 28 
	 "111101110011",  	 --  3955 	 29 
	 "111110101101",  	 --  4013 	 30 
	 "111111100111",  	 --  4071 	 31 
	 "111111011101",  	 --  4061 	 32 
	 "111110100011",  	 --  4003 	 33 
	 "111101101001",  	 --  3945 	 34 
	 "111100101111",  	 --  3887 	 35 
	 "111011110101",  	 --  3829 	 36 
	 "111010111100",  	 --  3772 	 37 
	 "111010000010",  	 --  3714 	 38 
	 "111001001000",  	 --  3656 	 39 
	 "111000001110",  	 --  3598 	 40 
	 "110111010100",  	 --  3540 	 41 
	 "110110011010",  	 --  3482 	 42 
	 "110101100000",  	 --  3424 	 43 
	 "110100100110",  	 --  3366 	 44 
	 "110011101100",  	 --  3308 	 45 
	 "110010110010",  	 --  3250 	 46 
	 "110001111000",  	 --  3192 	 47 
	 "110000111110",  	 --  3134 	 48 
	 "110000000100",  	 --  3076 	 49 
	 "101111001010",  	 --  3018 	 50 
	 "101110010000",  	 --  2960 	 51 
	 "101101010111",  	 --  2903 	 52 
	 "101100011101",  	 --  2845 	 53 
	 "101011100011",  	 --  2787 	 54 
	 "101010101001",  	 --  2729 	 55 
	 "101001101111",  	 --  2671 	 56 
	 "101000110101",  	 --  2613 	 57 
	 "100111111011",  	 --  2555 	 58 
	 "100111000001",  	 --  2497 	 59 
	 "100110000111",  	 --  2439 	 60 
	 "100101001101",  	 --  2381 	 61 
	 "100100010011",  	 --  2323 	 62 
	 "100011101101",  	 --  2285 	 63 
	 "100100100111",  	 --  2343 	 64 
	 "100101100001",  	 --  2401 	 65 
	 "100110011011",  	 --  2459 	 66 
	 "100111010100",  	 --  2516 	 67 
	 "101000001110",  	 --  2574 	 68 
	 "101001001000",  	 --  2632 	 69 
	 "101010000010",  	 --  2690 	 70 
	 "101010111100",  	 --  2748 	 71 
	 "101011110110",  	 --  2806 	 72 
	 "101100110000",  	 --  2864 	 73 
	 "101101101010",  	 --  2922 	 74 
	 "101110100100",  	 --  2980 	 75 
	 "101111011110",  	 --  3038 	 76 
	 "110000011000",  	 --  3096 	 77 
	 "110001010010",  	 --  3154 	 78 
	 "110010001100",  	 --  3212 	 79 
	 "110011000110",  	 --  3270 	 80 
	 "110100000000",  	 --  3328 	 81 
	 "110100111001",  	 --  3385 	 82 
	 "110101110011",  	 --  3443 	 83 
	 "110110101101",  	 --  3501 	 84 
	 "110111100111",  	 --  3559 	 85 
	 "111000100001",  	 --  3617 	 86 
	 "111001011011",  	 --  3675 	 87 
	 "111010010101",  	 --  3733 	 88 
	 "111011001111",  	 --  3791 	 89 
	 "111100001001",  	 --  3849 	 90 
	 "111101000011",  	 --  3907 	 91 
	 "111101111101",  	 --  3965 	 92 
	 "111110110111",  	 --  4023 	 93 
	 "111111110001",  	 --  4081 	 94 
	 "111111010011",  	 --  4051 	 95 
	 "111110011001",  	 --  3993 	 96 
	 "111101100000",  	 --  3936 	 97 
	 "111100100110",  	 --  3878 	 98 
	 "111011101100",  	 --  3820 	 99 
	 "111010110010",  	 --  3762 	 100 
	 "111001111000",  	 --  3704 	 101 
	 "111000111110",  	 --  3646 	 102 
	 "111000000100",  	 --  3588 	 103 
	 "110111001010",  	 --  3530 	 104 
	 "110110010000",  	 --  3472 	 105 
	 "110101010110",  	 --  3414 	 106 
	 "110100011100",  	 --  3356 	 107 
	 "110011100010",  	 --  3298 	 108 
	 "110010101000",  	 --  3240 	 109 
	 "110001101110",  	 --  3182 	 110 
	 "110000110101",  	 --  3125 	 111 
	 "101111111011",  	 --  3067 	 112 
	 "101111000001",  	 --  3009 	 113 
	 "101110000111",  	 --  2951 	 114 
	 "101101001101",  	 --  2893 	 115 
	 "101100010011",  	 --  2835 	 116 
	 "101011011001",  	 --  2777 	 117 
	 "101010011111",  	 --  2719 	 118 
	 "101001100101",  	 --  2661 	 119 
	 "101000101011",  	 --  2603 	 120 
	 "100111110001",  	 --  2545 	 121 
	 "100110110111",  	 --  2487 	 122 
	 "100101111101",  	 --  2429 	 123 
	 "100101000011",  	 --  2371 	 124 
	 "100100001001",  	 --  2313 	 125 
	 "100011110110",  	 --  2294 	 126 
	 "100100110000",  	 --  2352 	 127 
	 "100101101010",  	 --  2410 	 128 
	 "100110100100",  	 --  2468 	 129 
	 "100111011110",  	 --  2526 	 130 
	 "101000011000",  	 --  2584 	 131 
	 "101001010010",  	 --  2642 	 132 
	 "101010001100",  	 --  2700 	 133 
	 "101011000110",  	 --  2758 	 134 
	 "101100000000",  	 --  2816 	 135 
	 "101100111010",  	 --  2874 	 136 
	 "101101110100",  	 --  2932 	 137 
	 "101110101110",  	 --  2990 	 138 
	 "101111101000",  	 --  3048 	 139 
	 "110000100010",  	 --  3106 	 140 
	 "110001011011",  	 --  3163 	 141 
	 "110010010101",  	 --  3221 	 142 
	 "110011001111",  	 --  3279 	 143 
	 "110100001001",  	 --  3337 	 144 
	 "110101000011",  	 --  3395 	 145 
	 "110101111101",  	 --  3453 	 146 
	 "110110110111",  	 --  3511 	 147 
	 "110111110001",  	 --  3569 	 148 
	 "111000101011",  	 --  3627 	 149 
	 "111001100101",  	 --  3685 	 150 
	 "111010011111",  	 --  3743 	 151 
	 "111011011001",  	 --  3801 	 152 
	 "111100010011",  	 --  3859 	 153 
	 "111101001101",  	 --  3917 	 154 
	 "111110000111",  	 --  3975 	 155 
	 "111111000000",  	 --  4032 	 156 
	 "111111111010",  	 --  4090 	 157 
	 "111111001010",  	 --  4042 	 158 
	 "111110010000",  	 --  3984 	 159 
	 "111101010110",  	 --  3926 	 160 
	 "111100011100",  	 --  3868 	 161 
	 "111011100010",  	 --  3810 	 162 
	 "111010101000",  	 --  3752 	 163 
	 "111001101110",  	 --  3694 	 164 
	 "111000110100",  	 --  3636 	 165 
	 "110111111010",  	 --  3578 	 166 
	 "110111000000",  	 --  3520 	 167 
	 "110110000110",  	 --  3462 	 168 
	 "110101001100",  	 --  3404 	 169 
	 "110100010010",  	 --  3346 	 170 
	 "110011011001",  	 --  3289 	 171 
	 "110010011111",  	 --  3231 	 172 
	 "110001100101",  	 --  3173 	 173 
	 "110000101011",  	 --  3115 	 174 
	 "101111110001",  	 --  3057 	 175 
	 "101110110111",  	 --  2999 	 176 
	 "101101111101",  	 --  2941 	 177 
	 "101101000011",  	 --  2883 	 178 
	 "101100001001",  	 --  2825 	 179 
	 "101011001111",  	 --  2767 	 180 
	 "101010010101",  	 --  2709 	 181 
	 "101001011011",  	 --  2651 	 182 
	 "101000100001",  	 --  2593 	 183 
	 "100111100111",  	 --  2535 	 184 
	 "100110101110",  	 --  2478 	 185 
	 "100101110100",  	 --  2420 	 186 
	 "100100111010",  	 --  2362 	 187 
	 "100100000000",  	 --  2304 	 188 
	 "100100000000",  	 --  2304 	 189 
	 "100100111010",  	 --  2362 	 190 
	 "100101110100",  	 --  2420 	 191 
	 "100110101110",  	 --  2478 	 192 
	 "100111101000",  	 --  2536 	 193 
	 "101000100010",  	 --  2594 	 194 
	 "101001011100",  	 --  2652 	 195 
	 "101010010110",  	 --  2710 	 196 
	 "101011010000",  	 --  2768 	 197 
	 "101100001010",  	 --  2826 	 198 
	 "101101000100",  	 --  2884 	 199 
	 "101101111101",  	 --  2941 	 200 
	 "101110110111",  	 --  2999 	 201 
	 "101111110001",  	 --  3057 	 202 
	 "110000101011",  	 --  3115 	 203 
	 "110001100101",  	 --  3173 	 204 
	 "110010011111",  	 --  3231 	 205 
	 "110011011001",  	 --  3289 	 206 
	 "110100010011",  	 --  3347 	 207 
	 "110101001101",  	 --  3405 	 208 
	 "110110000111",  	 --  3463 	 209 
	 "110111000001",  	 --  3521 	 210 
	 "110111111011",  	 --  3579 	 211 
	 "111000110101",  	 --  3637 	 212 
	 "111001101111",  	 --  3695 	 213 
	 "111010101001",  	 --  3753 	 214 
	 "111011100010",  	 --  3810 	 215 
	 "111100011100",  	 --  3868 	 216 
	 "111101010110",  	 --  3926 	 217 
	 "111110010000",  	 --  3984 	 218 
	 "111111001010",  	 --  4042 	 219 
	 "111111111010",  	 --  4090 	 220 
	 "111111000000",  	 --  4032 	 221 
	 "111110000110",  	 --  3974 	 222 
	 "111101001100",  	 --  3916 	 223 
	 "111100010010",  	 --  3858 	 224 
	 "111011011000",  	 --  3800 	 225 
	 "111010011110",  	 --  3742 	 226 
	 "111001100100",  	 --  3684 	 227 
	 "111000101010",  	 --  3626 	 228 
	 "110111110000",  	 --  3568 	 229 
	 "110110110111",  	 --  3511 	 230 
	 "110101111101",  	 --  3453 	 231 
	 "110101000011",  	 --  3395 	 232 
	 "110100001001",  	 --  3337 	 233 
	 "110011001111",  	 --  3279 	 234 
	 "110010010101",  	 --  3221 	 235 
	 "110001011011",  	 --  3163 	 236 
	 "110000100001",  	 --  3105 	 237 
	 "101111100111",  	 --  3047 	 238 
	 "101110101101",  	 --  2989 	 239 
	 "101101110011",  	 --  2931 	 240 
	 "101100111001",  	 --  2873 	 241 
	 "101011111111",  	 --  2815 	 242 
	 "101011000101",  	 --  2757 	 243 
	 "101010001011",  	 --  2699 	 244 
	 "101001010010",  	 --  2642 	 245 
	 "101000011000",  	 --  2584 	 246 
	 "100111011110",  	 --  2526 	 247 
	 "100110100100",  	 --  2468 	 248 
	 "100101101010",  	 --  2410 	 249 
	 "100100110000",  	 --  2352 	 250 
	 "100011110110",  	 --  2294 	 251 
	 "100100001010",  	 --  2314 	 252 
	 "100101000100",  	 --  2372 	 253 
	 "100101111110",  	 --  2430 	 254 
	 "100110111000",  	 --  2488 	 255 
	 "100111110010",  	 --  2546 	 256 
	 "101000101100",  	 --  2604 	 257 
	 "101001100110",  	 --  2662 	 258 
	 "101010011111",  	 --  2719 	 259 
	 "101011011001",  	 --  2777 	 260 
	 "101100010011",  	 --  2835 	 261 
	 "101101001101",  	 --  2893 	 262 
	 "101110000111",  	 --  2951 	 263 
	 "101111000001",  	 --  3009 	 264 
	 "101111111011",  	 --  3067 	 265 
	 "110000110101",  	 --  3125 	 266 
	 "110001101111",  	 --  3183 	 267 
	 "110010101001",  	 --  3241 	 268 
	 "110011100011",  	 --  3299 	 269 
	 "110100011101",  	 --  3357 	 270 
	 "110101010111",  	 --  3415 	 271 
	 "110110010001",  	 --  3473 	 272 
	 "110111001011",  	 --  3531 	 273 
	 "111000000100",  	 --  3588 	 274 
	 "111000111110",  	 --  3646 	 275 
	 "111001111000",  	 --  3704 	 276 
	 "111010110010",  	 --  3762 	 277 
	 "111011101100",  	 --  3820 	 278 
	 "111100100110",  	 --  3878 	 279 
	 "111101100000",  	 --  3936 	 280 
	 "111110011010",  	 --  3994 	 281 
	 "111111010100",  	 --  4052 	 282 
	 "111111110000",  	 --  4080 	 283 
	 "111110110110",  	 --  4022 	 284 
	 "111101111100",  	 --  3964 	 285 
	 "111101000010",  	 --  3906 	 286 
	 "111100001000",  	 --  3848 	 287 
	 "111011001110",  	 --  3790 	 288 
	 "111010010101",  	 --  3733 	 289 
	 "111001011011",  	 --  3675 	 290 
	 "111000100001",  	 --  3617 	 291 
	 "110111100111",  	 --  3559 	 292 
	 "110110101101",  	 --  3501 	 293 
	 "110101110011",  	 --  3443 	 294 
	 "110100111001",  	 --  3385 	 295 
	 "110011111111",  	 --  3327 	 296 
	 "110011000101",  	 --  3269 	 297 
	 "110010001011",  	 --  3211 	 298 
	 "110001010001",  	 --  3153 	 299 
	 "110000010111",  	 --  3095 	 300 
	 "101111011101",  	 --  3037 	 301 
	 "101110100011",  	 --  2979 	 302 
	 "101101101001",  	 --  2921 	 303 
	 "101100110000",  	 --  2864 	 304 
	 "101011110110",  	 --  2806 	 305 
	 "101010111100",  	 --  2748 	 306 
	 "101010000010",  	 --  2690 	 307 
	 "101001001000",  	 --  2632 	 308 
	 "101000001110",  	 --  2574 	 309 
	 "100111010100",  	 --  2516 	 310 
	 "100110011010",  	 --  2458 	 311 
	 "100101100000",  	 --  2400 	 312 
	 "100100100110",  	 --  2342 	 313 
	 "100011101100",  	 --  2284 	 314 
	 "100100010100",  	 --  2324 	 315 
	 "100101001110",  	 --  2382 	 316 
	 "100110001000",  	 --  2440 	 317 
	 "100111000010",  	 --  2498 	 318 
	 "100111111011",  	 --  2555 	 319 
	 "101000110101",  	 --  2613 	 320 
	 "101001101111",  	 --  2671 	 321 
	 "101010101001",  	 --  2729 	 322 
	 "101011100011",  	 --  2787 	 323 
	 "101100011101",  	 --  2845 	 324 
	 "101101010111",  	 --  2903 	 325 
	 "101110010001",  	 --  2961 	 326 
	 "101111001011",  	 --  3019 	 327 
	 "110000000101",  	 --  3077 	 328 
	 "110000111111",  	 --  3135 	 329 
	 "110001111001",  	 --  3193 	 330 
	 "110010110011",  	 --  3251 	 331 
	 "110011101101",  	 --  3309 	 332 
	 "110100100110",  	 --  3366 	 333 
	 "110101100000",  	 --  3424 	 334 
	 "110110011010",  	 --  3482 	 335 
	 "110111010100",  	 --  3540 	 336 
	 "111000001110",  	 --  3598 	 337 
	 "111001001000",  	 --  3656 	 338 
	 "111010000010",  	 --  3714 	 339 
	 "111010111100",  	 --  3772 	 340 
	 "111011110110",  	 --  3830 	 341 
	 "111100110000",  	 --  3888 	 342 
	 "111101101010",  	 --  3946 	 343 
	 "111110100100",  	 --  4004 	 344 
	 "111111011110",  	 --  4062 	 345 
	 "111111100110",  	 --  4070 	 346 
	 "111110101100",  	 --  4012 	 347 
	 "111101110011",  	 --  3955 	 348 
	 "111100111001",  	 --  3897 	 349 
	 "111011111111",  	 --  3839 	 350 
	 "111011000101",  	 --  3781 	 351 
	 "111010001011",  	 --  3723 	 352 
	 "111001010001",  	 --  3665 	 353 
	 "111000010111",  	 --  3607 	 354 
	 "110111011101",  	 --  3549 	 355 
	 "110110100011",  	 --  3491 	 356 
	 "110101101001",  	 --  3433 	 357 
	 "110100101111",  	 --  3375 	 358 
	 "110011110101",  	 --  3317 	 359 
	 "110010111011",  	 --  3259 	 360 
	 "110010000001",  	 --  3201 	 361 
	 "110001000111",  	 --  3143 	 362 
	 "110000001110",  	 --  3086 	 363 
	 "101111010100",  	 --  3028 	 364 
	 "101110011010",  	 --  2970 	 365 
	 "101101100000",  	 --  2912 	 366 
	 "101100100110",  	 --  2854 	 367 
	 "101011101100",  	 --  2796 	 368 
	 "101010110010",  	 --  2738 	 369 
	 "101001111000",  	 --  2680 	 370 
	 "101000111110",  	 --  2622 	 371 
	 "101000000100",  	 --  2564 	 372 
	 "100111001010",  	 --  2506 	 373 
	 "100110010000",  	 --  2448 	 374 
	 "100101010110",  	 --  2390 	 375 
	 "100100011100",  	 --  2332 	 376 
	 "100011100100",  	 --  2276 	 377 
	 "100100011101",  	 --  2333 	 378 
	 "100101010111",  	 --  2391 	 379 
	 "100110010001",  	 --  2449 	 380 
	 "100111001011",  	 --  2507 	 381 
	 "101000000101",  	 --  2565 	 382 
	 "101000111111",  	 --  2623 	 383 
	 "101001111001",  	 --  2681 	 384 
	 "101010110011",  	 --  2739 	 385 
	 "101011101101",  	 --  2797 	 386 
	 "101100100111",  	 --  2855 	 387 
	 "101101100001",  	 --  2913 	 388 
	 "101110011011",  	 --  2971 	 389 
	 "101111010101",  	 --  3029 	 390 
	 "110000001111",  	 --  3087 	 391 
	 "110001001001",  	 --  3145 	 392 
	 "110010000010",  	 --  3202 	 393 
	 "110010111100",  	 --  3260 	 394 
	 "110011110110",  	 --  3318 	 395 
	 "110100110000",  	 --  3376 	 396 
	 "110101101010",  	 --  3434 	 397 
	 "110110100100",  	 --  3492 	 398 
	 "110111011110",  	 --  3550 	 399 
	 "111000011000",  	 --  3608 	 400 
	 "111001010010",  	 --  3666 	 401 
	 "111010001100",  	 --  3724 	 402 
	 "111011000110",  	 --  3782 	 403 
	 "111100000000",  	 --  3840 	 404 
	 "111100111010",  	 --  3898 	 405 
	 "111101110100",  	 --  3956 	 406 
	 "111110101101",  	 --  4013 	 407 
	 "111111100111",  	 --  4071 	 408 
	 "111111011101",  	 --  4061 	 409 
	 "111110100011",  	 --  4003 	 410 
	 "111101101001",  	 --  3945 	 411 
	 "111100101111",  	 --  3887 	 412 
	 "111011110101",  	 --  3829 	 413 
	 "111010111011",  	 --  3771 	 414 
	 "111010000001",  	 --  3713 	 415 
	 "111001000111",  	 --  3655 	 416 
	 "111000001101",  	 --  3597 	 417 
	 "110111010011",  	 --  3539 	 418 
	 "110110011001",  	 --  3481 	 419 
	 "110101011111",  	 --  3423 	 420 
	 "110100100101",  	 --  3365 	 421 
	 "110011101100",  	 --  3308 	 422 
	 "110010110010",  	 --  3250 	 423 
	 "110001111000",  	 --  3192 	 424 
	 "110000111110",  	 --  3134 	 425 
	 "110000000100",  	 --  3076 	 426 
	 "101111001010",  	 --  3018 	 427 
	 "101110010000",  	 --  2960 	 428 
	 "101101010110",  	 --  2902 	 429 
	 "101100011100",  	 --  2844 	 430 
	 "101011100010",  	 --  2786 	 431 
	 "101010101000",  	 --  2728 	 432 
	 "101001101110",  	 --  2670 	 433 
	 "101000110100",  	 --  2612 	 434 
	 "100111111010",  	 --  2554 	 435 
	 "100111000000",  	 --  2496 	 436 
	 "100110000111",  	 --  2439 	 437 
	 "100101001101",  	 --  2381 	 438 
	 "100100010011",  	 --  2323 	 439 
	 "100011101101",  	 --  2285 	 440 
	 "100100100111",  	 --  2343 	 441 
	 "100101100001",  	 --  2401 	 442 
	 "100110011011",  	 --  2459 	 443 
	 "100111010101",  	 --  2517 	 444 
	 "101000001111",  	 --  2575 	 445 
	 "101001001001",  	 --  2633 	 446 
	 "101010000011",  	 --  2691 	 447 
	 "101010111101",  	 --  2749 	 448 
	 "101011110111",  	 --  2807 	 449 
	 "101100110001",  	 --  2865 	 450 
	 "101101101011",  	 --  2923 	 451 
	 "101110100100",  	 --  2980 	 452 
	 "101111011110",  	 --  3038 	 453 
	 "110000011000",  	 --  3096 	 454 
	 "110001010010",  	 --  3154 	 455 
	 "110010001100",  	 --  3212 	 456 
	 "110011000110",  	 --  3270 	 457 
	 "110100000000",  	 --  3328 	 458 
	 "110100111010",  	 --  3386 	 459 
	 "110101110100",  	 --  3444 	 460 
	 "110110101110",  	 --  3502 	 461 
	 "110111101000",  	 --  3560 	 462 
	 "111000100010",  	 --  3618 	 463 
	 "111001011100",  	 --  3676 	 464 
	 "111010010110",  	 --  3734 	 465 
	 "111011001111",  	 --  3791 	 466 
	 "111100001001",  	 --  3849 	 467 
	 "111101000011",  	 --  3907 	 468 
	 "111101111101",  	 --  3965 	 469 
	 "111110110111",  	 --  4023 	 470 
	 "111111110001",  	 --  4081 	 471 
	 "111111010011",  	 --  4051 	 472 
	 "111110011001",  	 --  3993 	 473 
	 "111101011111",  	 --  3935 	 474 
	 "111100100101",  	 --  3877 	 475 
	 "111011101011",  	 --  3819 	 476 
	 "111010110001",  	 --  3761 	 477 
	 "111001110111",  	 --  3703 	 478 
	 "111000111101",  	 --  3645 	 479 
	 "111000000011",  	 --  3587 	 480 
	 "110111001010",  	 --  3530 	 481 
	 "110110010000",  	 --  3472 	 482 
	 "110101010110",  	 --  3414 	 483 
	 "110100011100",  	 --  3356 	 484 
	 "110011100010",  	 --  3298 	 485 
	 "110010101000",  	 --  3240 	 486 
	 "110001101110",  	 --  3182 	 487 
	 "110000110100",  	 --  3124 	 488 
	 "101111111010",  	 --  3066 	 489 
	 "101111000000",  	 --  3008 	 490 
	 "101110000110",  	 --  2950 	 491 
	 "101101001100",  	 --  2892 	 492 
	 "101100010010",  	 --  2834 	 493 
	 "101011011000",  	 --  2776 	 494 
	 "101010011110",  	 --  2718 	 495 
	 "101001100101",  	 --  2661 	 496 
	 "101000101011",  	 --  2603 	 497 
	 "100111110001",  	 --  2545 	 498 
	 "100110110111",  	 --  2487 	 499 
	 "100101111101",  	 --  2429 	 500 
	 "100101000011",  	 --  2371 	 501 
	 "100100001001",  	 --  2313 	 502 
	 "100011110111",  	 --  2295 	 503 
	 "100100110001",  	 --  2353 	 504 
	 "100101101011",  	 --  2411 	 505 
	 "100110100101",  	 --  2469 	 506 
	 "100111011111",  	 --  2527 	 507 
	 "101000011001",  	 --  2585 	 508 
	 "101001010011",  	 --  2643 	 509 
	 "101010001101",  	 --  2701 	 510 
 	"101011000110");  --  2758 	 511
	begin 
		return tmp;
	end init_rom;
	signal rom : memory_t := init_rom;
begin
	process(clk,ADDR)
		variable addr2 : natural range 0 to 2**m - 1;
	begin
	addr2 := to_integer(unsigned(ADDR));
	if( falling_edge(clk)) then
		q <= rom(addr2);
	end if;
	end process;
end rtl;