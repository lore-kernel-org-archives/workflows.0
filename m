Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039067;
	b=2rAx0lOvhNIFocCihzz3wWWcq0DNaQf/jCZ5qhPY4aZYXlnmpDvRfdGcKiZDWWNNU/eS
	 vQfbUHgayqBKAHh3rjOspR+UV4WIlqbG6tLAIxJAc+t9m6u+Fx4Tn8tlVDjfRJVOr1Tqb
	 Rr0SgmMFCdFLu8WFNFKCUmyPH7KsVrMIn4/qd6dWFQmt5Izip5haNfkhfcH6fYrXWz/FL
	 E6FN93lb/IjGzpaI8OeFUjEHqpcjk0eADA3ou6fAcyabbTlCJQI2d752S+OJkISeJ9LIy
	 wINExHgUyK97xyuq+JPXsTLSx3NfKGlAMKu6wJojyjVKs2qDUcvGO9f+yhlP9C0tGzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
	b=WUmvvTYm4n9HVLEAdBXYcc5q6kucbg+vMJZrx9al1lDMPxzExKwCm01HYfsv0BrUbRpZ
	 XDV1EhScM4rE+Is7QRuSnOj1M2uHyKrNvVQ4YF81Nv1AM/twn/2pcyxMEjyS+m0bGX0lB
	 yKG5pV13hfOJvH0iuKWq7exKPrKS/q4U/JagWljRJKPSwg1HxgHng7FLvop7/ZP53XYNH
	 tWVM4iTalKYVJ3v5IBXh2e5N7npi6biUzlAQf/E68BA37QTCmULsP7xLTz1TBwOZv89Kh
	 I9Bn1iygkQq9niRFYpbSgnUcgnV9ZWuJGbCmgAD6MWsbX8TF8ykM/Y2d1mTq3VDJQxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFA606A326
	for <workflows@vger.kernel.org>; Sat,  7 Nov 2026 08:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso200645566b.2
        for <workflows@vger.kernel.org>; Sat, 07 Nov 2026 00:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039065; cv=none;
        d=google.com; s=arc-20260327;
        b=bG54girNrSxFAs+E16Frr9o/03BN2lX8CHRu9ze4foXbJHGKPvJKK7A0u2id+NRJEH
         XJ7Zam3jefFFc7Cvbp2xnwDCK18GDwVPcRI9OdEqVytFxHtn1wMaWznrCAetU9iwj6xb
         99oxe14JsawHmjfXBaVkIyRu9lhHMDN4xSUKSTDY7vk0T5E7YFoj5B+J7mjrGuKQbEsb
         SwvWRV2oQqu+iasx2sAYCMI2ny6bcVwKTUrkbHcYPet0qqPyiPIrQOnDa3VyiTw16Z8z
         6GAg5TKexGigYFBS/D/SaaUrDlHSvD/1BrB+tqzCNWjplsRgRmqOt0aV6dNpQkP4r5F2
         dC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        fh=o7HHyi/dmv0n4lVyf/q9oFua0DIdHBaalJpsxWCQiDk=;
        b=s9nVfQb0Xfz49tHiNU0C37owSrptea6ONhHMmRQWshpJQTQAzprP2MRbgwQXTebXE3
         wkmSmXWU7E0Q+yVomVO6HOuCj0kDlnY9eWSsXfBypns59GqU+iSVgHxJxwtLSV0d2yqE
         RAtNVcGN9b0lpq49uxUe64h4dGIVu/AUF3NB5Z8ZumErecUWIRUWz3KHBQ2rlew412Ps
         MUIDNhNI5B/m2V4JMVkEIdGavo/hcXlPenU2eSNFhvoKnS/M6sBou8cYLP1smM961n4I
         URkihfXFNa00edMTGtV880SBKINZz6+PpzLj+SMqdZUUdF+OLr37BWfoI+SfVtMUb4Uw
         GPzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039065; x=1794643865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=UAngRiUm8pvle7Zr0N0Z3j/tjMuBQv7NRKrwX+M3eKVi62jW5XULdpmOnrOqCDRXFY
         oFpoFh15sCmEXCV5Wia4j+6VR+39+PY+YGPzpVJPSkhSxLs5LYJOEeGhs9yn5UXzcJF5
         KXTFAo3X1cM+Yn7TfMyxZ9OMfshOve/iLaZvoIN1D/CNAIhXbFez++hBzPhAsRYk5gLJ
         40VIwf/8wisKrQijYzuIhmjGodeFBP5g2dBCfNbv1WmcqOAtzxBKlQwEjKLP9721bR/D
         tC0AWJ+Fq9hG4gYji6X+AY3kbwU3keUZ28cD2W2q9ybn7Igzt6rtzTw8bZNUGApKSy9l
         /duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039065; x=1794643865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=hY8JmVfBe9CaOfzE6Cjg2xwJHTXEwBzmtDsRCs61cbiJ9CJc6twOyGreSTH2tC7E2d
         lV1ByuqpBWt6V5pTBEBqy0b0ubnqnuU5ZTgDcb6O5egSP/eS/RVqf7aimQoxkwrbwGtj
         SPC9vG4U+2BYPfDBYPYogsBC08WWFyY1rYHO74SB8HBuzjEJiXX3HTMtFoBxOurEMBfL
         Ztu435sQhd9OPJUnLPpNqdfqoA3FHgSksTOofb9rh/31YOjE+7i/W/cX7Pr9tC3VoNSh
         nXRj+OL7trpzkGet04dU4Q4JPQQoxxWJDY7FPAQNzAwc0Qwo0c4DdYMWNs11zloDliyc
         WBrg==
X-Forwarded-Encrypted: i=1; AKwUvBy9jnr+ME8RVUY1Zi0db3xGxb6pByCXyKDDLj1yZ9yhALYpuAGBQFxZEQk/ZM4YY/BvHo5DtgO8Cso=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ck4lR3mX7iKjLnjpx01DNINNiZlgnYdaUyg/wQKv4WJOfJBqW
	zFuRdkH2Bw+n/UPBzc1IX9s3QcvVdphC1H1My9yN4n0YNbJDxsCJR4Ye69MSe/TLCUC0+yWqMRD
	H2Nu5F1mINkQxtRZ78yuMRY9c1aJHp0E=
X-Gm-Gg: AYBFou1M8Mfy7XopixZOXokZXlpzpS4ZPKMthTcAOjzaRdRrcg2JnyyjZLLg14PZssy
	i8i7yaBabF9rtPxt8PjKmTUNvefbQDmdNj9EYHo5rxODo/UPO14uhYGMARadRxs4j+ZwJ5vHPQH
	ANRuXwbFVpR5QwSu1Pzbe2Sp5brJaGORg9XUjoMW6jWffj0x3UjV/jUPBdHw0gCeoMAVwoSWnDV
	MMREy8giSRf4cE4au81ODC4WiVd9l3mokvPiU/vj371qjsQMfvrN9LulwaE/laBmVwJT6h+vvxh
	gcWU2vgboLM2ArYK642Vkv0X6tTcXWjLkRlUNCsKve1uIhm5aRAToTDy6Rv07jZGEbb3RFHrZbh
	W0EcQmKh7aSIRQPbh0YEvd2PMfXuDsPLEW0qKLdM=
X-Received: by 2002:a17:906:9f92:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c4d355ac266mr404152166b.39.1794039064583; Sat, 07 Nov 2026
 00:11:04 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com> <871p8x9iqw.fsf@trenco.lwn.net>
In-Reply-To: <871p8x9iqw.fsf@trenco.lwn.net>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Sat, 7 Nov 2026 02:10:53 -0600
X-Gm-Features: AclHuK91DUkFbpNIFEt0OfQGSbn-rF_ZJ46dBlm5lWx6Q5YsF6mXZsaQ93GyhPU
Message-ID: <CAHDi9tqKP6R_zE08jLLMcYHP53sZB8r2M+fRgP8c53GT8Dxu+Q@mail.gmail.com>
Subject: Re: [PATCH] doc: process: clarify legacy status of applying-patches
 and point to Git
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>, 
	rdunlap@infradead.org, krzk@kernel.org, wy@wyuan.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

Sorry for the confusion and the noise. The six earlier messages were
accidental resends while I was learning how to manage revisions in b4-
please disregard them.

This single patch is meant to replace those earlier attempts (I also
accidentally duplicated the commit message into the cover letter).
Would you like me to resend it as a clean single-patch v2 without a
cover letter, or is this version fine as-is?

Thanks,
Oscar
