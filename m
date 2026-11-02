Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631940;
	b=yLUo9MRg/Lv/u4vfbMp3VkOhXaIRey0iGsABD2tvIyWcCz5Xh+13GilUq0otxMWbEDt4
	 wAaqT2yUrsGzMZyNGTpHg18rKvMb3hertAPqEYawohO/OdHSMEuyDYYIBjJ++kYjrgunN
	 tkbdj72vXEeyWs9B0g/Xbj0ewaJ7OMhouXiJCGgS24cvAWaBPd1iJDlytol2iFa+94+lk
	 Ks49CQSTIDdjawzY5jffs0BNSs8OXMlejT6l6+4lfSGvK246YSGtkbf4cyPoek5TphuKU
	 zjRmRZLVgYXRIx+bpWb4UwfrZY4BfCaP2Y8BzVnvKYwrPigd18GJ5zizJUF0AophrOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
	b=gd/RAURDdZIWdyxnBzl9XI34N93gNHOSBchEMYhbxZaskqnFV8w/9HgrK27Jgx9vLPnG
	 EEvIFwTDiXlGHGFO3DqNoSJeqZfpP4NSpNgQoJDxwHk/rUHEqwLEC4Lmga4FdBqkHLmPU
	 iga8rAzYRrzdfoXhrUWFyKkdvITi1v05cVFDxKvaYMZxKQ6f2kkuL+NgUzK+H7l3YuxfH
	 MET2CsK7z1Nntp8htD2JP300A+u49+0b37bBeDbZtdmP1ZUfXr8hdsCoRUTwc85ysOgKz
	 lFHth23+8XPNbA7/JiFZSnE6Hmq8ZxiWn4oTAHORrRJMqXMC2LzUKaxasjqCWoOYmIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0841A606AE95
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 15:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0841A606AE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a215e64962so28221485e9.1
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631938; x=1794236738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=UoYunkSYxQznh5bFA75G99i2y2WW9E086osI9oKEp6qIqKaUZRR8w4CxHUrPRkqq5S
         FfmqCJGlVnKa5ovIyVvTW73QdAbq7tDgFU70uuBcb+R92YkXxYaOc6CL8ZMXYWHPP754
         wnsrxDcNSQBDr4jBTgmIADLNqhAKGAMdasjK3IrK0W6zgen1NiBV5tV2pWpdcjzjLeNI
         cBi8+BY4ejD39ai1Abt1TdY+LOIdW/wMxJ/Q8fXMJii7S0kVXjVQQPDvpFRIa95v+eWH
         QOTM3mH0vfW6dScDz4mjR07lz/jXDaBKe8q4rfMgUMR2OvxIGPW1WvDHBlLe8jXj9orb
         jxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631938; x=1794236738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=y+NSZAF4XlA2Andgv1/xU2PJftm0bh/vpJW7hMFxkJv/OhFCt5m+OT8AacKpRuHXYR
         /mTU/xzUam9jIarh0L5+GupL/zRmcRD6znwxSlQiNepai6nrxN1ohWX6f7sOBh6T9mao
         Z8rClrycpV4wa74uDBMcik/ONDKQUOtbd7GtAvt1EnlUlgRZoZmp96BPfAtnHYwX7ZKy
         W3fnEbvn53k56dC8zXVcPjf2u35ByrtW8UPl0IvOM0mTyz8qHBKryuk/fy4a2RD2WRC/
         6Uu9QZ0fWqEpNZx3qKsHlTRtjO7Rv6rD7E54Cwj/tw9l07DrM/HTE9osSi0UwbMkA2eU
         /woA==
X-Forwarded-Encrypted: i=1; AKwUvBwgf6v+4/a5LAwkPXwVLZ96JLNAUmNqjXu3Qqzsl2y4bi8sngG0Jx2/PRTvdFmniI370EmCj90DTH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWX9EPCxmFqR4OOcK1nnlSYBNkuj08iIYkt6c8H5xGe1TnGH6K
	tn8voQGgtlWcjq7B8qAHacK+c8UqEdM27e9TjhWqueRmRYO+CNOtWxvi
X-Gm-Gg: AYBFou1aajzqwQkiQJefUGiNVKyVI9/UIStac6RBPZcE8gLqoapUbB56KLnwJrLlQV6
	KmT5YA0gBwmd9h/aG+JKbmgmCcvWiOS5n2+8UN1p/vT+vtQiZR6ZeQ9ywGltugVn7sAdehGo7Zt
	dmpYWpVc5mc/jJaT429rmaZcSQXZe+p27w0njHCMOK/yYo3LSgX9Kcel+8Tj4rxppGcknanbTbD
	Q+I5/3S19ANvrcGhcivl7Xcbs3cfiX6x3+wvO0X/U7CPoUzCcyM1vAeWu7To16k8F2pfwHHGne2
	nF3V2Vf5LgPGimnXCrHmXh0UWaD8WsJlw0lWd24MxjLhF65DGFD8bUSs+9mjsmHirkhxLfzCW9T
	eDHDAsGdBbefEQbRrqhn8NHcX39DDy4A1uVxYDNOecnXdc5X6AIJhUhx3zI+btSdLCRWWQ/rmli
	M9IskxmlYznUJVvEkvUo/DCVLntzXn4SY1GYFwoMFgXYTGie56gf7445nuECG3xNBMu4A94OgNt
	DHzVkiZFNZvaCuPTwxA+RnWcP7LsxJLVE9ul/QIRhFGGEcJVCXsSpDynAIZtmFiubZYopOg5e1v
	T4/s3RMpg/9Fsp9uOlqpCDBQnZhZec1SJ6nx/GNUbyVUbIj48RkDrJaSVfZ/6GXG
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr206305535e9.33.1793631938076;
        Mon, 02 Nov 2026 07:05:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm128041915e9.2.2026.11.02.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:05:37 -0800 (PST)
Date: Mon, 2 Nov 2026 15:05:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <87a4nrfgjm.fsf@trenco.lwn.net>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 07:34:37 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> 
> > So it occurred to me that it might be actually better to stop sending
> > messages directly to LKML subscribers and only make it available for
> > download somewhere and as a Lore archive.
> >
> > Is there really anyone depending on receiving all of the LKML traffic every day?  
> 
> * raises hand
> 
> Some of us crazy people really do depend on it, yes.

I certainly scan it.
It is also useful to have an archived local copy that can be searched.
I can see a point in not copying all of netdev to lkml, but there is
little point not copying patches to low-volume lists.

David

> 
> jon

