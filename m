Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612345;
	b=TMxti6DnRxZwoAYTiJrGyyAou5EbjWhCeOriZxszhV5QCZK7ruP8Kp/WD1r9tc5ECnuh
	 zFjRtSqoppggAWO8t0uBA2EuRMnLWLWnSRo1gQh/nS3a0u3eZ3BzVcmjQkaxZlBXyM2L0
	 XyWYyj8lChgqKcAcI3UiUBxVrBGfTNLwCqS9PuL0lVSCuNyT4NWaAUJDQWu6jZ9Igj8Qh
	 0P545yG2hXGJMsY/xq7MnnyYrUsSVZkx2/wHQYxTEiNV1C5K/2HdLKRKUZwB6tZitOdKX
	 ggv+Yhg+qAskO65CPeVP+O1jU/RIRFDJbbco6eGR5OOxpnTuzGuv7dDFuHDafcCoM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
	b=OUdgdcj8yi5MnzSvfJFVS851+76cbYc6pYD1YKRhWQXLTqOd5PwpN317LJ5hUDfpC0WG
	 8Az59wDgegvacYbH4/VFIoRWZ3DD7yu4MJHC5w49HFavBoCVcaHqQy3VoW80CI9by9AiA
	 4qMGl4Zq/+Y3b4DiT+1tZEt8+p+LoH8CAPtyFO5KlHV5qugXctPvsNjpylwLgQure4X/J
	 eRQ/cjiOezmoeWhvT02MWaqMDbOeI2jKpyiLkZaK7skxW52ogYeEHAHMSo5RsI6/w4/+G
	 e4NjAZNPPRVvzqU4YAIUmW1a7FPsRsmapMhP29xx+BJ7TwbwrJ96B+x/2zJnlcJki7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9733606A329
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 13:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9733606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d360ca878so53141011cf.2
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 05:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612344; x=1796217144; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=fzOaOKNR08ayDz631qIR5YM6RbDX4cXMRZT7PE5kvvn/ZKKFy8OqDo0kxL/CGZipfh
         yXsGpHHPH7x4KIMUFiT0hBdTKg/FHDQ+cFEBZ56hKsPDzqho3JjjnjCYeAOgQuhqrCCx
         Kyuv2Qgb2LwbL3/jeN6fbvh05cZA5VXL+0kBnF+1toR/jZjXSZvEN7CM5ELf3o5aREvn
         Eluy+jaX3sWqlm/AYzmzvCNEWh8yt3FwyrbW07O1L9zQIfpd2BGAQi/jkH+nk0STPApP
         ptq4+5w9OImGltbnF0OW7sw20wlbr2yCaaAbLC2GzlR8rCvoWGScBAMjYdoKnZdgnhiD
         xAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612344; x=1796217144;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=X435FDF8IRCP5ZaTkZOHyi1G4JAUs6hdPx3PbLikA4skHGluP00A027gH1HYYp1O55
         xBpQxHy0i1EMwdh1YtS9J66XDD2HzOMYmNoPCvbzLL1J0OsE6HeheXJyE0Gfdnknk5f7
         g9qydoP6zrrjE67cGs4z9jgEdl7Lyq3iKHtHKoZiYF2bpegNdbOT0hYZU79nJCGz18Ru
         oJN+0u7vQPTcjIvacLTp8ujrtB+yrd5OVHdd15QiLBEKUL39oEn1TcY0psPDzxdg5/P8
         iVlzFkt+FegexFqJTb/sR4PBO13VVmgNcEfv5g07HGCXss7+WYv4Z9fi2Me8MpAC0Pc9
         Ci/w==
X-Forwarded-Encrypted: i=1; AL+hErGMSgAQ7ZOOtAFgWsDrDGYS8Hq3L5HWL4oUbYX6O88r+E8laUBRtpZSTazBqIlEpcpWRFaNZS9eBd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z834PdezgLURbrXgQJ8S3OQqW8TahiiltN+sBtA93B/zEllIGdF
	+zdExhqeZWdG4TbwvaFBmR+u/jmCrlfwWc+umNvMdGP/0LkgZvorKrA=
X-Gm-Gg: AZFdTZfcfbwAWotzwVonDN9E8QjwPj3mP0Mq0VeaNj3/tOls6Lma5qhOdccpVzT5Wfh
	aHDMcsoHUPhIcn0lxvWzPoJ+Yhd5Zyln/yAqcGPpQFLw9wJE1VZsb/Z97NEqAF2Js7mDKfDUD5Q
	Ztn6qsNjyk4fAx4ofMC3O6ObfnCEL3950OBwW+IqerDXKgLmFAN1nlCGe8V97tIz1fHEjLpyeCW
	FbavEP2CMy9d4I4c5o42ZGjeTxW13nZ3ropqjIALp4nzwtoC0YxGuPAHdiZZcFrYzIG9da7/+yg
	6NQP8ttgDOao3ewdmBBevoscbVVHX8kJeQS4wMWmreOErZKgHs/iak+91FmzgvmHGX0AXauyzmm
	ra3tDphtT2cSIERtwei6wW6i7526lzuX7W02E9kKzWW6WgRdRpBOLoB5mP3eexPhPNOw207eOXn
	LnxdafsbsUhpwJklKmn6BveXoegHSXNJ/KFKsoGGwgVdc+dFEhJNMOsGtAWWM50qNGYMxaKK77x
	Cgu4hmOZhi43chF2nDI5VIDmlwW2zEp6/yYPjd7tPmkMDk3D+emZ7e5QqsXCFh0Vxx+0HLhreF1
	fhnLLJgX9O0lvouMt+OD6Lv3ZgbH4569yLoFddExWqcrY+bm2HCU9+lB8bjLFsKutmIwSyd7l95
	b6R8fJlbFMrFHRYyADPlGbpBcNWoYFNIsOM9CexyeHi+AA5RGlDrHlp6NAETelY2Zk3MxNQ==
X-Received: by 2002:a05:622a:410b:b0:535:157b:ea22 with SMTP id d75a77b69052e-55d76ac5e33mr308582181cf.40.1795612343642;
        Wed, 25 Nov 2026 05:12:23 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:22 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179558107134.36587.13120861622026385297@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Message-ID: <179561234149.225312.4673144866194884043@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David,

Thanks for the review, good suggestions. v3 follows with both.

Thanks,
Eugenio
