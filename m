Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4974239E76
	for <workflows@vger.kernel.org>; Wed, 19 Nov 2025 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535249; cv=none; b=K2aZzJOTVinZNB7ExeNrhjNIcUXMn9RIdh71a1rOpl19G4imtOpFwSIhwkOMqZujzuXK6RkDS4sdmkqZXtwoIg+Q2LJi4ZXqm3futisRZCLAc6SqrntD121EM0Nf3lflWHzTFxscGmMpSYK45bQWXEQxHCLfjnyGG2ZDyemL728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535249; c=relaxed/simple;
	bh=c6iEQjBee6A/wie6G8Q6LazEnH0UOGUalPNLQFibx5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vE26h9GiP5gEuUHrDVNq7HLAVot5tgkDd9kc3yj29xMDf5AcW3Vg9tH9WiK+RygkeIaUPRmfzGhnCq6/duGbmlX9qWYU1GMjmvS1ASXC4X3eftL17Z0/zXmREj38V7HUsnmL27T+DOBnRcA+t+d+Lew9LknrIXGHJOsCha7z7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6IhmAnZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6IhmAnZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so7711795b3a.3
        for <workflows@vger.kernel.org>; Tue, 18 Nov 2025 22:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763535246; x=1764140046; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E38F5iOCPuww5nf63JyXNJFqV8JGs8VUEvNS436chC8=;
        b=M6IhmAnZhCmDAxJ6+rwatoxSzjmUIdQBjZTw6GmK94PahmrSO7LZX8/CajRVbiisr2
         8p9DhM81U80bxNk9lWQrQWoVuKIzQnX/TiyEpus6jxARGVcvyipeZeiSjq27mdYkd0v5
         xYed+LdrptsdyYOoKeUG9pMEwO7u5vzQkIN5NR8G4kIbirDHmrfX3mP7mge9Uwa9IG7e
         Jx/V6rydRS2nbNT19jVpxnth8vSrnmUi35EdZq0taDRKBob6aYILp6fWtXmeRMSG8Wlz
         Tce+b5YEsn5wK2ZL9E0DWvQbdaK+S8wMz7TgiMTUDHH6qnDaX+He2WLT+tzXvG8nwIqG
         gFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535246; x=1764140046;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E38F5iOCPuww5nf63JyXNJFqV8JGs8VUEvNS436chC8=;
        b=wKCmctr9gNKhRUE73sxSNxMHAxPq62WD6BcEj+xh1cP4ejLXtqvlqAQIrPAmHDpDEN
         /H00wfIyJ+1RCjcX2W97PlwYIsiijeA6t4RodWA/0855cwF+8YlZpCCSG2D66XeWmaqu
         sPgg2XGSRenfqaySp3gvLTEele90Mxov7AATVam9rzGiH4o0ekLI7nWRN76cgx2SRgnK
         9avkoMwUbkQ8W3USo9mVV9GnnhBay7/eNZxNAKqcImMeMtcRJ7zd5JF9Z4XBg8iLqhR6
         zkCTFB48gjh6U3uVYHmpdmlyM88cyCG/WktCGxzK1Gyq4CFED1SKp03ZNWepjbzr4ywr
         q5/g==
X-Gm-Message-State: AOJu0YyAAnRTLuCC2gg2KO05q+ZQB83EBXOZrucyinYODeAqIUVa/X9E
	+ZatBnUoUxDvfcTjMqLj5J/FnRnClo6zN1zlic8DV3RumSk4z9sF3J7e
X-Gm-Gg: ASbGncvoluXv4OKDg06LSmb95JIHR58vFUXnR3seQEzzQkZ7+8w8pa9oiJJwG5bf7Al
	wLBAF841UN9uc5nUePEVe0dsrag3Pf0PQ3Pajo30D9nxNPQaK2JUaPUeON3gAZkBgQ+uha2B+VU
	6fD8004QphDemXoTEzWH8wRAhaaq1z1GN+RHn3H0cjmVAW3N6gqnzOG7wBrZCDSCHtq2VlrRDc0
	OVir99Gs2cgifXQRziFB95bsiVmzuDvxl9eCm2g2YK0Y1Nbrc59yxMLRdy09Sv78QxZr8oAkWW/
	kvT/Ew0/NAmn967pU0XohpLmBgiE/HZpiY3v12Mx4WAhrtJNGyqsGygYpyXO3AyAZurdS/e+NN9
	PPBteC+04z6z+WLgG6+1cBlk2gDvFBVaLR1nXLCw3G6Gj8NI+Xi8H8NwxxsHMOphiFVMIYywZ8J
	CWnJdNd6KZet6+AlWzLwNVup3zMZoXOfJZxQlCQvQmxO8xpYngf5FK
X-Google-Smtp-Source: AGHT+IEjnUsFYS10TLbM75bHXZXCUsiqQdjKngnrPrJ8OU9rffukFhVefJ8mrLpSM76VWL08dDLKJw==
X-Received: by 2002:a05:6a21:3397:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-35dcc9a8d3emr15383274637.47.1763535245724;
        Tue, 18 Nov 2025 22:54:05 -0800 (PST)
Received: from ?IPv6:2401:4900:60d7:2218:52ea:a17:db14:a44? ([2401:4900:60d7:2218:52ea:a17:db14:a44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm17221460a12.23.2025.11.18.22.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:54:05 -0800 (PST)
Message-ID: <24e675622cd33404f8717189205658b016332131.camel@gmail.com>
Subject: Re: [PATCH RESEND v4] checkpatch: add uninitialized pointer with
 __free attribute check
From: ally heev <allyheev@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
	 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, Geert Uytterhoeven	
 <geert@linux-m68k.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>
Date: Wed, 19 Nov 2025 12:23:56 +0530
In-Reply-To: <20251117-aheev-checkpatch-uninitialized-free-v4-1-fbee16ffeab9@gmail.com>
References: 
	<20251117-aheev-checkpatch-uninitialized-free-v4-1-fbee16ffeab9@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-17 at 08:40 +0530, Ally Heev wrote:
> uninitialized pointers with __free attribute can cause undefined
> behavior as the memory randomly assigned to the pointer is freed
> automatically when the pointer goes out of scope.
> add check in checkpatch to detect such issues.
>=20
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@su=
swa.mountain/
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
> Testing:
> ran checkpatch.pl before and after the change on
> crypto/asymmetric_keys/x509_public_key.c, which has
> both initialized with NULL and uninitialized pointers
> ---
> Changes in v4:
> - fixed UNINITIALIZED_PTR_WITH_FREE description
> - Link to v3: https://lore.kernel.org/r/20251025-aheev-checkpatch-uniniti=
alized-free-v3-1-a67f72b1c2bd@gmail.com
>=20
> Changes in v3:
> - remove $FreeAttribute
> - Link to v2: https://lore.kernel.org/r/20251024-aheev-checkpatch-uniniti=
alized-free-v2-0-16c0900e8130@gmail.com
>=20
> Changes in v2:
> - change cover letter and title to reflect new changes
> - fix regex to handle multiple declarations in a single line case
> - convert WARN to ERROR for uninitialized pointers
> - add a new WARN for pointers initialized with NULL
> - NOTE: tried handling multiple declarations on a single line by splittin=
g
>         them and matching the parts with regex, but, it turned out to be
> 	complex and overkill. Moreover, multi-line declarations pose a threat
> - Link to v1: https://lore.kernel.org/r/20251021-aheev-checkpatch-uniniti=
alized-free-v1-1-18fb01bc6a7a@gmail.com
> ---
>  Documentation/dev-tools/checkpatch.rst | 5 +++++
>  scripts/checkpatch.pl                  | 6 ++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-t=
ools/checkpatch.rst
> index d5c47e560324fb2399a5b1bc99c891ed1de10535..c61a3892a60c13f7c5ba89e96=
9e39a93a3dcd5bc 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -1009,6 +1009,11 @@ Functions and Variables
> =20
>        return bar;
> =20
> +  **UNINITIALIZED_PTR_WITH_FREE**
> +    Pointers with __free attribute should be initialized. Not doing so
> +    may lead to undefined behavior as the memory assigned (garbage,
> +    in case not initialized) to the pointer is freed automatically
> +    when the pointer goes out of scope.
> =20
>  Permissions
>  -----------
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 92669904eecc7a8d2afd3f2625528e02b6d17cd6..e697d81d71c0b3628f7b59807=
e8bc40d582621bb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7721,6 +7721,12 @@ sub process {
>  				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\=
n$stat\n");
>  			}
>  		}
> +
> +# check for uninitialized pointers with __free attribute
> +		while ($line =3D~ /\*\s*($Ident)\s+__free\s*\(\s*$Ident\s*\)\s*[,;]/g)=
 {
> +			ERROR("UNINITIALIZED_PTR_WITH_FREE",
> +			      "pointer '$1' with __free attribute should be initialized\n" . =
$herecurr);
> +		}
>  	}
> =20
>  	# If we have no input at all, then there is nothing to report on
>=20
> ---
> base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
> change-id: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1
>=20
> Best regards,
> -----BEGIN PGP SIGNATURE-----
>=20
> iHUEABYKAB0WIQQBFRpOLrIakF7DYvaWPaLUP9d7HAUCaQ2YPwAKCRCWPaLUP9d7
> HDkPAP9+gFqrD4O5qsYZzxGFwfXPAY7F8TM0lfYy7fLNxA2brAEAwLyLuyN0h7qg
> N7da1PWuOGK8tKeZ9dR4r3gFdlbZMAo=3D
> =3Dzo4P
> -----END PGP SIGNATURE-----

There's an ongoing discussion about making this rule global
https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel=
@HansenPartnership.com/.
I will wait till weekend before making any more changes.

Also, CCing James Bottomley
