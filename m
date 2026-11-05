Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871010;
	b=zphH7ZF/g1pOcOb8RkF4zzoHcXxI7CYzETJALMFuf5CJ0OrDE9hJtJCDMOFZ3r24Dsj/
	 +8Ab7W3opJ+mHymKca8Avnor0sR5V+COE1WGozQ1oIaD0HRClrIGjri/qQFDZd97W3J5O
	 iADZDuKDgs7tzUZm+IUXVDyyCswJvEZX3b+hWYjcEH6/MdFZ5XJ/oySR5Fnp/+6IK/Ffn
	 NzQuBI0Fju/go5y5K/o1xt5eTJxx0rVZJ+akYSBvfurd3szNMYtf4RBNaoIle8NrGZxAK
	 Ic19C8gDsP3LG6dAPWfjJkUbKKT2FiGeI3GTXUy16uMnjvcii8qH6xM4vDMj0tLayTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=QCEsbVvAntiwkUNj9XuXv/+EV+V+S2+h/LkdvF92WZw=;
	b=KHMHyhAks1e4NJoHbVeCwjYsqAPBoPXPyornA2M9j9N1ioiyje8OklGemhvdDoRk7AHi
	 /A6Zuu/F7ymgRQZV1nI6OEY53UZ5XuOxic1Mb6tI6a6sAlAuwfGNYuC1nTpME+b8XrXW7
	 3SgmkZQSRDN2z3Jt5yRKDt4j/wKPehH9kF96w1tKoaYgTh2bDk9IQ8Ycmknk0N1BFNNvj
	 hgvsEU1XBwjJ5ESXurOsV30QLeG6TYVyW0Mn/2Cau76Vm25iaLX3AxKdgKGQbS7du3Ry4
	 jyPCE05HWo8AMIzj46+Mq+69RZe1xrOfXLN25VQ/u7WcPcxv+WdTpxf7TwIeYd8iv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CE0ljZyU;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC53606D801
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 09:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC53606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CE0ljZyU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so259228866b.3
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 01:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793871008; x=1794475808; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QCEsbVvAntiwkUNj9XuXv/+EV+V+S2+h/LkdvF92WZw=;
        b=CE0ljZyU3JqjQftBnz7ZG/XvtXqH4zsNnMzzMzlDejAUi9hrCdt6oFvtgRRF1DeLu8
         L+PSgNGY8z3739K7mt/YvtkA1z7FVGq/ASAsVobJ9JdyHjPtxlU2OhdpX7qKWJJoCEx+
         D5F8uiTNE89zz/YdsmC94OE9rEqlpegYXPP8KqhRM/bN0GrM6pdItRswUx8T637K0Q7V
         LycHg2Qg7/eIL6J77aVArF6yYkgeW2F4eDbCKA/Ma2UIHGFZ8ncRQbuyjJUB64f2jErB
         0IXHJQbsvmIAe6GowuvegvKNeOaHvQgvo3HZO7FymUuFz/tbeUx72/ObWZtxRaJz5Tg9
         R2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871008; x=1794475808;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCEsbVvAntiwkUNj9XuXv/+EV+V+S2+h/LkdvF92WZw=;
        b=Ql8u6uGFe3769S8sC/bnCPnANQuGpQAIaUhXQKusAH+5zbrjc96jlL3zT6YfaYdVwZ
         cNNPkbmmjprCox4JgiZTTt8rLkv+nq3KRUJSm9eD3s8PotNfo7uefzgX6VNEq37DbUAu
         u296tyB/yH7QJ4g15JZHFBuu6mLfid0EN0LMNfqjzQ3N6BKIl19MLc9Cix23r+mRXeEF
         9Sk84j3dKSLKt3A9A9etzOvJvOx0ayHZfhigWRf1FXzk7zqWM2UIRRL/Yd9kbuMZ7J24
         4ESi8HaLBZ8u5kLKGsPYFb6pp9hJBzySQThT4KQ6dKyFBg3e0mYWJ7JgjyIEh2LigUtx
         WlQA==
X-Forwarded-Encrypted: i=1; AKwUvBzCeqojMzviYtmk6Y466Pu0MRuxJnbgpjynMlGxq8idxadM1mBr77zVA8leobp9H2px4GG/FPxgnDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NcKgyQnNz5wGvSfrsm2GBQvEH45oBrKnYerCqsP6dVgOUPrru
	BSmYcXqw616DPAdrgIauYIcwGsYfmm6Fz1NOhr4V7r0qC87i/bbaFcp+Iz334lDQdQM=
X-Gm-Gg: AYBFou3y63cnkJgCeAd3Sjd1ltnRpYzKivWpG4Q+E31dotiiKWmpoiZTABqUIsDNmHN
	P/KiMiJld19HbGFp4CsCFl3Zgu6uIUgRT/NfWsig53Mu8u08NJFw5eDdcqwkhf6lSwuL0Hvi0QZ
	dFo9nHAII6+8Ig0eGUrt/22w/2602H5Er3gWwqGMl1WIkR7ogLrvgZj2Z5wl7OpLFQqB4lO5rxo
	xZQWKeyH1KKiod+IDAPi3E0ICtUSV4fctB9LYNuVd+Rs12fnVbRZbfibmNv/Dg+o0vNnGx3A8IU
	zJzTooKzdlYSRQWL7hHEF74lJM9d70J1RS81Z1ics2JrNPLo2VcS/jaCSbgbJTN1yB3qWtoovBl
	FKfwqnK6ZMbOfiv1NnbjZlrZIyBbXIq7HNqKx/c/YGkdo3QL7bT77tO8mVJQurEOHfSkkSXU9gN
	HFwFNUpFvf5fCrbICZQ53OXrjx7PACkWMCSfwtSVYGusEA6vPoKDOUk4kpUYclJXiJ1eUjsl727
	v+cJ/q0RdCEHSaFCExs7ASBsv4vDvmjha22axy39HIlYuXH2VfWMmdHktw+FGuAGm5mg5wlwzf9
	fPMqNBVXaPYfHXn85UZ1PxNokuq20TgqTCJl4/e6VzdXtYm1Us6Rm+CLQ2JObGBPyAYvzo273QG
	hMKf8j5HSv78YwNr3NbaVoMmWhRRds/tCXDIWb80=
X-Received: by 2002:a17:906:7309:b0:c46:645f:cedd with SMTP id a640c23a62f3a-c4ca7a18e93mr1702795566b.8.1793871007709;
        Thu, 05 Nov 2026 01:30:07 -0800 (PST)
Received: from ?IPV6:2a00:12d0:ae14:da01:7192:20e9:9bab:a518? (2a00-12d0-ae14-da01-7192-20e9-9bab-a518.ip.tng.de. [2a00:12d0:ae14:da01:7192:20e9:9bab:a518])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e0a8sm156301866b.15.2026.11.05.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:30:07 -0800 (PST)
Message-ID: <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
Date: Thu, 5 Nov 2026 10:30:06 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
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
In-Reply-To: <auxKHF7U1x_Ozwpm@ashevche-desk.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KiqSlvBv8iyFxlUX7TMDgPwE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KiqSlvBv8iyFxlUX7TMDgPwE
Content-Type: multipart/mixed; boundary="------------Tk9D3n0xFwddgTNKLbe0ptak";
 protected-headers="v1"; hp="clear"
Message-ID: <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
Date: Thu, 5 Nov 2026 10:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
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
In-Reply-To: <auxKHF7U1x_Ozwpm@ashevche-desk.local>

--------------Tk9D3n0xFwddgTNKLbe0ptak
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjYgMTA6MTksIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMDUsIDIwMjYgYXQgMDk6Mjc6MzBBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4+IFJlZmFjdG9yaW5nIG9mIGRyaXZlciBzdWJzeXN0ZW1zIG9yIHNvbWUgY29y
ZSBkcml2ZXIgcGFydHMgb2Z0ZW4gY29tZQ0KPj4gd2l0aCBjaGFuZ2Ugb2YgdGhlIGFjdHVh
bCBkcml2ZXJzLiAgSWYgdGhhdCBoYXBwZW5zIHdpdGhpbiBvbmUgcGF0Y2gsDQo+PiBwZW9w
bGUgZ2l2aW5nICJSZXZpZXdlZC1ieSIgdGFnIG9ubHkgdG8gcGllY2Ugb2YgdGhlIHBhdGNo
LCBsaWtlIG9uZQ0KPj4gZHJpdmVyLCBhbmQgaWdub3JpbmcgdGhlIHJlc3QgaW5jbHVkaW5n
IHRoZSBtYWluIGNvbmNlcHQgb2YgdGhlIHBhdGNoLA0KPj4gYXJlIG5vdCByZWFsbHkgcmV2
aWV3aW5nICJ0aGUgcGF0Y2giLg0KPj4NCj4+IEFzIGV4cGxhaW5lZCBpbiB0aGUgU3VibWl0
dGluZyBQYXRjaGVzIGRvY3VtZW50LCB0aGUgIlJldmlld2VyJ3MNCj4+IHN0YXRlbWVudCBv
ZiBvdmVyc2lnaHQiIGlzIGZvciBwYXRjaCBhcyBpbiAiZW50aXJlIHBhdGNoIiBtZWFuaW5n
Og0KPj4NCj4+ICAgIChhKSBJIGhhdmUgY2FycmllZCBvdXQgYSB0ZWNobmljYWwgcmV2aWV3
IG9mIHRoaXMgcGF0Y2ggdG8NCj4+ICAgICAgICBldmFsdWF0ZSBpdHMgYXBwcm9wcmlhdGVu
ZXNzIGFuZCByZWFkaW5lc3MgZm9yIGluY2x1c2lvbiBpbnRvDQo+PiAgICAgICAgdGhlIG1h
aW5saW5lIGtlcm5lbC4NCj4+DQo+PiBUaGUgc2VudGVuY2UgaXMgZXhwbGljaXQgYW5kIGNv
bXBsZXRlLCBtZWFuaW5nIGl0IGRvZXMgbm90IGFsbG93DQo+PiBpbXBsaWNpdCB2YXJpYXRp
b25zIGxpa2U6ICJ0aGlzIHBhdGNoIG9yIHBhcnQgb2YgdGhpcyBwYXRjaCIuDQo+Pg0KPj4g
UmV2aWV3aW5nIHBpZWNlcyBvZiB0aGUgcGF0Y2ggd2hpbGUgaWdub3JpbmcgdGhlIG1haW4g
cGFydCBvZiBpdCwgaXMNCj4+IG11Y2ggY2xvc2VyIHRvIEFja25vd2xlZGdtZW50LCB0aHVz
IEFjaywgYW5kICJSZXZpZXdlZC1ieSIgY3JlZGl0IHNob3VsZA0KPj4gbm90IGJlIGFwcGxp
Y2FibGUuDQo+IA0KPiBJIHN0cm9uZ2x5IGRpc2FncmVlLiBJdCdzIGFsbCBleHBsYWluZWQg
aW4gdGhlIHBsZW50eSB0aHJlYWRzIHlvdSBoYXZlIHN0YXJ0ZWQNCj4gb24gdGhlIFN1Ympl
Y3QuDQo+IA0KPiBUTDtEUjogQXMgYSByZXZpZXdlciBmb3IgdGhlIHBpZWNlIGluIHF1ZXN0
aW9uIEkgaGF2ZSBkb25lIG15IHBhcnQgZnVsbHkuIEl0J3MNCj4gbm90IG15IGlzc3VlIHRo
YXQgdGhlIHBpZWNlIGlzIGJ1bmRsZWQgaW50byBhIHNpbmdsZSBwYXRjaC4gV2UgaGF2ZSBv
cHRpb25zOg0KPiAxKSBhc2sgdG8gc3BsaXQgKGFuZCByZXZpZXcgYXMgc3RhbmRhbG9uZSBw
aWVjZSk7DQo+IDIpIGFkZCAocGFydGlhbCkgUmIgd2l0aCB0aGUgcG9pbnRlcnMgb2Ygd2hh
dCBleGFjdGx5IGhhcyBiZWVuIHJldmlld2VkOw0KPiAzKSBpZ25vcmUgKHNpbGVudCBhZ3Jl
ZW1lbnQgd2l0aCB0aGUgcmVzcGVjdGl2ZSBzdWJzeXN0ZW0gbWFpbnRhaW5lcidzIG9waW5p
b24pOw0KPiA0KSAuLi5zb21ldGhpbmcgSSBmb3Jnb3Q/Li4NCj4gDQo+IChldmVuIHBhcnRp
YWwpIFJiICE9IEFjay4NCj4gDQoNCkkgZnVsbHkgYWdyZWUgd2l0aCBBbmR5Lg0KDQpBcyB0
aGUgWGVuIG1haW50YWluZXIgSSBvZnRlbiBoYXZlIHRvIGxvb2sgaW50byBzdWNoIHJld29y
ayBwYXRjaGVzIGFuZCBvZnRlbg0KZW5vdWdoIGVzcGVjaWFsbHkgdGhlIFhlbiBzcGVjaWZp
YyBwYXJ0cyBhcmUgbWVudGlvbmVkIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbg0KYXMgImNv
bXBpbGUgdGVzdGVkIG9ubHkiLg0KDQpJIHNlZSBhICJSZXZpZXdlZC1ieTogLi4uICMgWGVu
IHBhcnRzIiBpbiBzdWNoIGNhc2VzIGFzIGEgZmVlZGJhY2sgdG8gdGhlIGF1dGhvcg0Kb3Ig
Y29tbWl0dGVyIHRoYXQgdGhleSBkb24ndCBoYXZlIHRvIGxvb2sgaW50byB0aG9zZSBwYXJ0
cyBpbiBtb3JlIGRldGFpbC4NCg0KVGhlIHZhbHVlIG9mIHN1Y2ggYSBSLWI6IGlzIG1vcmUg
cXVlc3Rpb25hYmxlIGluIGNhc2Ugb2YgYSBwdXJlIHJlbmFtZSBvZiBhDQpmdW5jdGlvbiBv
ciBzdHJ1Y3QgbWVtYmVyLCBvZiBjb3Vyc2UuDQoNCg0KSnVlcmdlbg0K

--------------Tk9D3n0xFwddgTNKLbe0ptak--

--------------KiqSlvBv8iyFxlUX7TMDgPwE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrsTJ4FAwAAAAAACgkQsN6d1ii/Ey/n
gwgAlVRUFH9s5zdSztX2VcwcH2ThtZ+3R5mE9mCYBu+5/jBVppj0nmKwfl6FxYvWVxLvvG+PYVZv
rdtKt8r5dESAEpIJuDVejsc9nLa7llpOjdeJc07d8OC3QM0lefJe23VbKyuQg1gGFlqd82WHRmnY
ZPyafU6XgKO8RmI6s5Wb6XUZopYeld397NSW7FJya661cIk59MqsU6tA+JiVFIiRaCoe8230Ip4r
tErLpJwvdoERK1WHWJBh/RQXDsJaMmqXaOOQ2mdEMKbqat4G6ErH0iZM+/KA10FDLI4MnkXR+9rS
xdLuQfKu5BSLX1dhk7NicR2vPIRWv+9P9tYvf47MZg==
=sG+8
-----END PGP SIGNATURE-----

--------------KiqSlvBv8iyFxlUX7TMDgPwE--
