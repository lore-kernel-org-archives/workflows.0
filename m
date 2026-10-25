Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938093;
	b=mk3I5TfNnYzSJrTw+p9y7Vp5HfZVqFyjvG3IFj9aOV5CMUIdRMdzfUXHCfAq6r1gM6xE
	 WHQ/vVYHM7zG96Jlojms12FGEenCrKcAgqxRMRHzOxsgXqpHaIpduZw82meypIMfXSfX9
	 VmCC8vb4UXhsR+dSILsia9HnkAyIpkRPumcrdCTH/z+YZwgXwtmwK0PT4tb5v7V0CVYCd
	 CeBzD5+hfckcl+CpszzBYSjX4Rt9ECac6AwqHCy56LT3K2Z0T0bDRuve8V7fk7oGe7DVe
	 YDVqpkEAsURmBTdFNriQPL/WIK4NYPxm1k6BFCdqIA6XViIQRLtgjsaS2Si0IG9HMhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
	b=V3zZc8TNoix8VEtDdL3YY6y5s4U+N3lu0Su1TIiBkiDVz6/ovKuHyNWppP9Sy1cPiAQ6
	 oI7Tz1M6y5VeuHTJNMIa41sesafSdI2M/TnG2MXMlt/zz0B/KMnruQVKi54sm9CJCps4D
	 ffNdFGxbwc+CBNZqv3cQIgxWqrDqmxI1xHxrZ9Yr5KveYSs83psa9mg0rOTPoZ1mYvoSa
	 HbLf7dlxnhuR5kW+2utXnEUjTCloRKKnvZEIxrO/E3T++Z/hDNRjuzXVbXEMXjEEHMNxq
	 i2ldV+YGaY0JS1wOEeq04VWAf9ERWA+i6QdtsXTCx1j+//RYTZ4vWnT9wR8o7+0HN5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01A606A31B
	for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E01A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ba8fcc684so22885146d6.3
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 07:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938092; cv=none;
        d=google.com; s=arc-20260327;
        b=O7+owyxJmHOEZvIQHBe02kUD6JGlU0XmEK4zNDXTCJCYhrpOcS5Thrcn9U8LDHPQt/
         Mgh43q+kyqFW3wDa1krc0whVKq2J9pyXkFMfttOel9DReyA+QH73w2PuauFUiUBxz87i
         lyGjcgWhGsqZz1WZUtENm0Hq1GLBlLhaBoaVLBX6Qs/LFSaqiLyPfLZ9C3QPJ49y2gGA
         HmWI57ynFbXAeBrxExSQvJKVKnbwxhMY3hcgeumAEnEBnY9ZZLOK53gv1Qi6DBIYaRGd
         EFUZGvq4Yv3Hn1e+OH05NZVrwXe/EGj9YAI+CZpv6zgoMs8WErFKag0nSwFR3TrbSsmJ
         S2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        fh=HMuiKZNnxO9zwqwSRyTBCo9qNRVHLjusDYMRFivw++c=;
        b=VI6zniBGKEjwJul7ebJH/Ubth/s3B8uudtK/TX4AX9IPJoTpMnMVTL/Y+ZEt+afvgN
         eNVZRlxEbywx8gG8c41hnWxxIkfQhG99spF8oVNYuyl7RNNQjtozbeL5AYDQvv2LG3i9
         mwMfBhX70QKQPNXLqBY4AMDu6UoAMUl51Pql0vNqY13ZqzUF27lGyFeNPLt8sasOutBe
         7u91bRog104KLDZ01uGz2FuXAqmSDtlkz3aCxv82mGW+xMlf1lbcVGN1YWWaIzeH/Gjb
         UyHe6mma45umReV9Z0HoKljRZz9qFA9E0usNuMBbvU+Y24gECCNVjgDvHGXt1g1tLM4l
         JIpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938092; x=1793542892; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=Yeh32JhtZmd2iC8QTwS3rSPC+4TSmNn+3v5gKoXld8RdwJJN3cxGhjaNGyXCto/O4P
         f+0jqrBrGvdQ2aISEC/WD/zgW5r7eSNj777rU0XiNu6UxMDUoRoJbJwRsvdMZwj4mVG+
         fRjhzGU1uQdgxHWWpYYg98vmTb2p0MK8hPXv80QRvnCu13AO68UzamMdcIiBnok+vEva
         aJVL++M0Y6f/ATiSXDOghgwOzxw4RiHirD2KgIemhiWiXjM+/P6PA1iES9c26TFg3nRY
         52ZwfNNhRZfVaFU2TG20+8PUDmVIeP0GLoiNDmaft7QhSttqZbo7dMYsXeBVR7c81S6Q
         3otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938092; x=1793542892;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=EW0r77iF8pJpfu1MrOrbaZrXZCh3gcQzLNgJbF9RzsUC/UVpNoR9IktHxals2v6qDA
         OIhfmI4wD2vPbZJ06yN3IvX9HCfmYE1h+e2Us5SJ3kKdDrWxK+qGLexlmlaZ7n5KnV+g
         1SYz4zkqr62VPw91HxspgTcGeZvBllsBqShTMmkM+xxLKpJtlgfrMNIXIrK8nNvtU+8c
         vMMzE7PBMtaN+3UrEvXP1fsBHCTCRR6lWbH9axLjo/vHCy+WTisnoVlR6zHNDokkXzz2
         Agby5NOl4Zbbs4hBE9jBl/N4kgNkUmGATrdqZngQcMmseU86KQQ8U8Dlljowje8B4Omy
         MqSQ==
X-Forwarded-Encrypted: i=1; AKwUvByJKlm1yF/IkJQewEfJaBgv5dM5JrBHqnnuZr856SK/dbk9rC88/Th98VWSCFboMjBfLvMZYCddg1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsqP4H/5qadnKPFvkMX8+2H6IY93e3eq3PjPExxzmaKVhkhrzn
	zuJQ57IxbKQ7WlWvu+C97dTR1c1x5ASJhgtbajcu4b4pTbhU40Snur2kSVBHNMXpyhbIK9pnIZ0
	xUmFoONBt+olYHSNjstsVoWZHR0zWj+k=
X-Gm-Gg: AYBFou2eE67rAUA7IlDToRoR1hxq7cX3GKpOSw8AeEUwSLniRTmpf0BlFFINmcM1aeG
	PwrWsozW+hCwqYe4aJX5lviK39uXQdEQcPn7YH/qPuxtDLJ9uqXENxJ0/Vu6JNcxF/AGR3wr2RT
	LCbvii9phEw4boAtHFpb8yPK/uFnJLlKkL/FwzZFTQZrkqenoY6mHV3j02y4aOGfgTLg6TreEH1
	6S7KOIuZXVwta3BjPW74AQFckgxj81FT50Rbqzim6cYmRrje2I+dfFVxk2SizKlr1BO0Cif7KSY
	uWoSLDAENG4v8D4edwyKks055ciASIV60ImwQYslmmnqO903CqeIqvmEqy4H3ZgQ6w9SFjidsAU
	iuAhKgIDEi8v8/mKxWnVcDo6rdsiNck4m8dCHxWEfv5o/Nm7DAoGVxytXRskULNaTdQHgXTF1jc
	Y0rZCoa27UtE2Sv9rJ7K8F4UJVqMEJB4OIa6ZNxEzKhx+Tocr7SF6cLwb7XGKX2pnjE2fUL9Ac
X-Received: by 2002:a05:6214:4601:b0:917:a943:c4c2 with SMTP id
 6a1803df08f44-91c48e56a20mr74345036d6.23.1792938092287; Sun, 25 Oct 2026
 07:21:32 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020142534.3533478-1-sashal@kernel.org>
In-Reply-To: <20261020142534.3533478-1-sashal@kernel.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:21:21 -0300
X-Gm-Features: AclHuK_3A6YoAPopWYDdBpyLpTtDAS3DEQEhpWyYqeQDBqHn86Lo3m1k1XEe8Gk
Message-ID: <CAMAsx6ch8bztwO2w+gA1xc2H8JEM-7haUd05dmyODN_=VWJ74A@mail.gmail.com>
Subject: Re: [PATCH v4] docs: submitting-patches: say which commit a Fixes tag names
To: sashal@kernel.org, corbet@lwn.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brads@mainlining.org, 
	gregkh@linuxfoundation.org, linux@leemhuis.info, mst@redhat.com, 
	error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Sasha Levin wrote:
> +Name the commit that introduced the bug. When using ``git blame`` to find it,
> +do not settle on a commit that only moved the code. If a later commit exposed
> +an older bug, add a Fixes: tag for that commit too. If the same bug was
> +introduced separately by more than one commit, add a Fixes: tag for each.

Hi Sasha,

I went through v4 against the tree (docs-next at f857ff5bf):

- the new paragraph sits between the description of the Fixes: tag and
the existing "Note:" about the stable rules, and reads well there;
- handling-regressions.rst does ask for this ("Add a "Fixes:" tag to
specify the commit causing the regression"), so the reference in the
changelog is accurate;
- I built the process documentation with the patch applied and it adds
no new warnings.

One thing for information only: checkpatch --strict reports the
"Assisted-by: LLM" trailer ("Non-standard signature" and "Unrecognized
email address: 'LLM'"), because Documentation/process/ in docs-next does
not describe that tag. If it is defined in the agents series or in
another tree, please ignore this.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
