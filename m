Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894344;
	b=m2bOpBaH8ELBnqby3MxxwlnpA12tDIIdOyVI3qd9gFLufgZHQ10/GWeYaqwHKKi4ZSO4
	 Tr07MfydmEH/jCKmXn054qRBmmD/y5M5tsMacpiLU27BkPoKGQ454x5+UIGNOFBOdronC
	 MWjntkQE6UW2PNJvwY0nuIfdoB3ni8VInu+vfHDI0q1XeZ8Q+1Hl6Imo/JZO8ISo1A+un
	 EeEqkpr55qyYogzaUTbPoekO5SAorhzjEO7eY7QGxvO/94S6vfEB477LFtkDsU50LeZs9
	 1W+C66xOUumkVaEnNiq8SZox4VVDuRc7P8zSHr18kZYSZBrQFqe2rJVCp087/ZHZ3qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
	b=pUAuooXMve3U2ze6K7YoBbJOtZzszcVbQ6rP70q8hcT2sQbQ4Da+BDZKX2CWVdT2T2xE
	 Hpa6LH4qn7lmfHCZ+4xC/GtcksCW7k0ASWhSOiicxZintp4NxhtpJWenWrmx3062sCGPv
	 T/MISnjpXHK8VvS9qdmibyN2NseqTwShyRycUR1GiRb43Ds0AlsMRIFteQyHeDvFriSCX
	 6Fo9ndUj3CBAsvxL4XllSMTPPW4ONQqbVkShYuX8szkbsvBb17s3a6Mi4ckK2Sb/YCbOD
	 aA1tBT+lOOPGxanFdIqY03O3Dv5OgKkgI75Bl3nSgoou1GP7WrbzXZoUkSX8a5lfMXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cr+QFFzV;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65810606A60E
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 15:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65810606A60E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cr+QFFzV
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3335447a12.0
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 07:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793894343; x=1794499143; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
        b=cr+QFFzVeIoztZMODOzKaypScXTCAJiTeiA/Cv9wpMnKZV9+9BzE7e1A4dQag1+Dzd
         uKmnNgB9yOtnueV0xwLoHZMFDJK9HMrr6ue6rzvwXcoa00gdMrv0danZBnL4v2GpcRoh
         mJZsyzyDHCVsK4o4hBbuTxDLGDlwaXRS0t/GExa5bSPikNhb12YK7hB180Q/4JY+Fuap
         Ot3UBzt0Fbn0kX65DM0N/uQSCRtejkKQhpRBMNlKwtreR9mrsLrazydtsoTq/Pk6/jMH
         7b6lpjH4n5UeH2wxD4fpclkplHWvrUPO/a1Q1tJJTuxP7Tet4TXN/BQ0nXb5Zx+oVwuG
         zFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894343; x=1794499143;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
        b=yyWAs4g7MGCqSQhl1SukYtNeNcyYXGywq4t00CUumFUdkqgZh9PemExHSeiJj1BQvb
         zMACnLr++7T4YEBzAyoMnSrf+GMRekyJx3G2qCJVJsz1QvCQxpCkZxVyc0ij9b3RxceX
         43lirgEw4uPDGCJoirmr8G10v+13+1h/tkz9TTxsr/nDR9MuSzvvwhFxlhjUexFdGmp3
         qj91ddh8VkFkae6V6QpYyFAm76W2TitaerUpGixTElJG3nRUeTnGJm+JdSUX74HjQfxq
         guzoUmN7nYG6d7/Z/3w9lRNtqSN1obRklTs/FIDyh2D1uzwx4FjLuYQm7NOfbcDM6PSz
         /iDA==
X-Forwarded-Encrypted: i=1; AKwUvBwPUF9xAJyNOoCA3O9+0IrcqmMT6fph+g4fNtg1mjxgobbM2cn0M86Lfi78Lxi+05NjzwFcoGZRTsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qgZimhVcb6uwQxqCs37JwRvrESGz8JiH7alOI8B3R/EgNE9eM
	0Nf6XdJfshp3SYpNUjqRhEwfdiiNrHCAe+ReSLSqqRLqZVbzQx/T9WXqz9k569FbNToFPx3yJWE
	f0T3R05A=
X-Gm-Gg: AYBFou3d0QpXbVK5Er31EhntD7mM8cspW6PzoRAGXR7Is20+WsS18gW3z+M6xFhpw+d
	r66ZtZZwUv91bY6WSkROtZd0T/P7LGsu5uaud9u25JsDrDUZ/CoP80qMYJQUowGV3Ec4XYQML0S
	Q1AS8vbaHR0SZEPqGlnJKFKjhihc1sLsMDhUdC+XaWH8iNtAlRsbHCSP1fuIThw0XBNWGDsxXGn
	s9jVdb09gyC5vKHCqM6HVh1ZL6txahHdyQDsHRvPNHlwcdda3ukzfnPf02IA0tcpwgpwHXU8Nlo
	Zzu6WoqMNtpLRXkjtT03/cpdIUM6NKv6RraOKjkiNVtp1nX4wouDYOY21wEDJKxdQlgvQnj8YHx
	1knEPkQUZjiKcFApGXYm5Z9LTHwESf8I0iMoSXZ9IXkzevvh+Ml2kpliy9RxekfdaH/oJpa6ryw
	OwD9s9GC3VIl4G4g6HOSbv7Pb02miMmyG6jawMn3w4ia5LahoE5v7a4tY2L98Co149ffvA7C7X+
	Nvzgd0h3idujX4YJrQFbwx23mKQdd4F4aVHt+6kJxJ1hiQLnVA7VN7i65GXtP+LKZTftgRdWS/m
	ICwjpalIWs9h+mvrQRvryMPspgOnowS+LN5zTHtBl4amvgczce9bhKA6hZv0y9p0CTub1RbLViM
	ZxUwqQ7oUXU4kX4iMiZs9yQb1ssI1gnD2wNqVNyXU+NPghSfK/w==
X-Received: by 2002:a17:906:dfc2:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c4d2895f829mr138239666b.21.1793894342532;
        Thu, 05 Nov 2026 07:59:02 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e43f586sm185869766b.35.2026.11.05.07.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:02 -0800 (PST)
Message-ID: <128f8491-d7d6-4b8d-85e5-20ce9ac506d6@suse.com>
Date: Thu, 5 Nov 2026 16:59:01 +0100
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
 <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
 <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qb0waMtCJNKIAE4U7Z52RYut"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qb0waMtCJNKIAE4U7Z52RYut
Content-Type: multipart/mixed; boundary="------------HJIhk848qAwrRZ0XMGqs5pkq";
 protected-headers="v1"; hp="clear"
Message-ID: <128f8491-d7d6-4b8d-85e5-20ce9ac506d6@suse.com>
Date: Thu, 5 Nov 2026 16:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
 <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
 <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>

--------------HJIhk848qAwrRZ0XMGqs5pkq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjYgMTY6NTMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFJldmll
d2luZyBwaWVjZXMgb2YgdGhlIHBhdGNoIHdoaWxlIGlnbm9yaW5nIHRoZSBtYWluIHBhcnQg
b2YgaXQsIGlzDQo+IG11Y2ggY2xvc2VyIHRvIEFja25vd2xlZGdtZW50LCB0aHVzIEFjaywg
YW5kICJSZXZpZXdlZC1ieSIgY3JlZGl0IHNob3VsZA0KPiBub3QgYmUgYXBwbGljYWJsZS4N
Cg0KSSBkaXNhZ3JlZSB3aXRoOg0KDQogPj4gUmV2aWV3aW5nIHBpZWNlcyBvZiB0aGUgcGF0
Y2ggd2hpbGUgaWdub3JpbmcgdGhlIG1haW4gcGFydCBvZiBpdCwgaXMNCiA+PiBtdWNoIGNs
b3NlciB0byBBY2tub3dsZWRnbWVudCwgdGh1cyBBY2ssIGFuZCAiUmV2aWV3ZWQtYnkiIGNy
ZWRpdCBzaG91bGQNCiA+PiBub3QgYmUgYXBwbGljYWJsZS4NCg0KQW5kIEkgYWdyZWUgd2l0
aCBBbmR5J3Mgc3RhdGVtZW50Og0KDQogPj4gVEw7RFI6IEFzIGEgcmV2aWV3ZXIgZm9yIHRo
ZSBwaWVjZSBpbiBxdWVzdGlvbiBJIGhhdmUgZG9uZSBteSBwYXJ0IGZ1bGx5LiBJdCdzDQog
Pj4gbm90IG15IGlzc3VlIHRoYXQgdGhlIHBpZWNlIGlzIGJ1bmRsZWQgaW50byBhIHNpbmds
ZSBwYXRjaC4gV2UgaGF2ZSBvcHRpb25zOg0KID4+IDEpIGFzayB0byBzcGxpdCAoYW5kIHJl
dmlldyBhcyBzdGFuZGFsb25lIHBpZWNlKTsNCiA+PiAyKSBhZGQgKHBhcnRpYWwpIFJiIHdp
dGggdGhlIHBvaW50ZXJzIG9mIHdoYXQgZXhhY3RseSBoYXMgYmVlbiByZXZpZXdlZDsNCiA+
PiAzKSBpZ25vcmUgKHNpbGVudCBhZ3JlZW1lbnQgd2l0aCB0aGUgcmVzcGVjdGl2ZSBzdWJz
eXN0ZW0gbWFpbnRhaW5lcidzIG9waW5pb24pOw0KID4+IDQpIC4uLnNvbWV0aGluZyBJIGZv
cmdvdD8uLg0KID4+DQogPj4gKGV2ZW4gcGFydGlhbCkgUmIgIT0gQWNrLg0KDQoNCkp1ZXJn
ZW4NCg==

--------------HJIhk848qAwrRZ0XMGqs5pkq--

--------------qb0waMtCJNKIAE4U7Z52RYut
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrsp8UFAwAAAAAACgkQsN6d1ii/Ey+N
VggAkLl0JUIsq7ZxVjmN0SxrbYQqYpuEah/g2Vrw4O6iCIJnV9Pc5W5s7r2OumPDV1BA5LDGs9PI
IlOPy1GEM4JjCaPiSwldXbmpdRZws9Incgf50Sb9hmDgyomoV1mrIlVmXqg+PVMqm9cXfEbxJ7Wv
mK355dU/+RgO118V2Ylom84nifGOLPfFInzgxn7Y1PIir/6d4qznXNzezOfTUkj2osc1wumpvLb8
h4OId8Bc56rP6vEUto7YoXvzpCudxQk4PEocw0FMYazaz79+C49aj1mgTHbNuE7Q5zO5CnWkXZoC
9YhKUGJCOhYEAtPEmViOPxDBfe2s92bWuxWiNCUnJw==
=FzgB
-----END PGP SIGNATURE-----

--------------qb0waMtCJNKIAE4U7Z52RYut--
