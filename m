Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF17356915
	for <workflows@vger.kernel.org>; Tue,  9 Sep 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438782; cv=none; b=fOKv9AnH04q+imNNWqHfI1l2LPCH/GUgdU72rpvO6qgDVEtTqv0yX5nfxT7ikBLKRBHBcn9SQg4kKNQPaEm+IazAcJVeqmE6PpiU9A2nWadlDlfh4QdjCuZ/jDVSjcyUJiZVQ+B5UMbDHXxL+TcOZ5NpwwH8fKVWc03bZzwTcDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438782; c=relaxed/simple;
	bh=w3dda49bNz9voqj0u5TQ4cIEZEIRTG781SvVnQ2M8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ze1cavYCTAPauihSKGlqYdGL5VWlp5mCd+d9u6my0h87n2SItNCPpMDM3/h1rnmc62WoNFRWBQ+6mIFYG0DH5ru1D0m5krhvoJn9QCZRG9deBfmCwc9FVCVdURwItT/nYFFax2I/758m7uwXutXOm1AmFeGBi4aT6K0tE2EZC04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=VcCaMTv2; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VcCaMTv2"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-410c884decfso10532695ab.2
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757438780; x=1758043580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXzL+MzBMX4xvnA/6SWkWrF76gCtEMsscBnEBOB1jMw=;
        b=VcCaMTv2suqC5faQX2pBWCioe1OYsCJ4bfms7giRM337sFhpVYpB90Fxny53UIp3Zq
         DitQITqzhwXJTsqXCDWftMfB0ZSv+lIBrjAxvmEkDwxWbb9Cy6Tb4zgOE0TRsLS5YHeD
         pVzipsU2Gf8chvAMBr1Z0uCe15ZxiSoAmUzqitePhdilGpHf3tu3nT44TrOgY3bfOXnG
         lUA7fU+DdZG+ch8j0ZJmZc3APLO8KsQvUhvPsyLzcRf9BjfdI19ih+r9HNtkCrWm8gqd
         DMRnKeKNjPrNEz22VtQu9tyPiwtLOG/JSOnzBBPj0Rg8YNaiOOixMjpvoLRuwDOcNWqh
         hwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438780; x=1758043580;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXzL+MzBMX4xvnA/6SWkWrF76gCtEMsscBnEBOB1jMw=;
        b=cphG34V91TJEEGJMdm5bwUfB80C/XMnU2QU9v9lFZefkPq8Y6NnqA9SJtsc6cFN/pt
         oYONjF4ZodONVFOotQzVvzX80g+2Vhd3xGmG44RP8SVYflfoJZ9mdFY1wf2bhSB3uMWa
         VLCBpdkZMJ19yf551zt/we9ccDNc9hfRHGw+z1it3SlENGQLmXNzVLPZAwK9HNmug2gv
         ii9G4To5cqCt8EMTgnB1Hn9VWmC/eO+WZ9mwrzk6XDK4sfwxPcxxkp5oO65UXm1hzkOe
         3WKnSlXu3VoPfOCGMo9A07b9JqoEza9hgaIHZebReixAGd3z4Q4Lu13yYJoPjtcRjoZ+
         ldfg==
X-Forwarded-Encrypted: i=1; AJvYcCXnlEn+Q3pmtxZCgrXYGpXUY+4yjAeMtIDdIw/guTfm+jwjrFAg5l/E665pPWGyPwJDVahVOYet23Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFvY+ycQCt9/hY3HPGOEs7e4NSs1yPnauT3lcmu2ewlQPY1fC
	n1PJiHAJXDuM0kK4MAlfGjjh54zJ44EG9OLrN170gtJz8X0wrOd5Ov8tB1r0oZ7MEVtknLBPbG6
	jFiqZ
X-Gm-Gg: ASbGncvNkGfiHdUGAVoxdz4VT0YWexnEFg8nO30vMPnc1jr8wvGuSQmS+2wokWsN5NG
	oT9zba7ZXu01vT/mZIfJo9N5+Uw1+j1aDHrGll/3BP2+v7Q7KuodMwS1mBuqlMKsdmhOvUHqFZz
	aHP6uvSxfvnFyJch/k6cQp0XspoLGJ+nwaCdcSAwRKCJY9oGHFi2vA7dZoIbVceOJ7JPoOCwDCJ
	cYpXuOQRkB36xT2y7v75C+9LSIfhK6a7aS2PPgj+bHyTllNfU+zU81BppkIBzCeQDHfNh142O3o
	cPluGMFjWKyXWSYKuFK20UiwmuJWHutIypDcy8w072bpFlzT5SqUVy4qOaUQPI5jjK/zsbO9wsS
	VIHz2dxP28nFXtHcQRCY=
X-Google-Smtp-Source: AGHT+IEDIJxRrCDoRd0PL3WQuDi8SnQ/UVNbt2HDmkns706+HN5Aesz/cR8Hq7g5UkgwMebu0TbTUA==
X-Received: by 2002:a05:6e02:12c3:b0:409:5da6:c72b with SMTP id e9e14a558f8ab-4095da6c7cfmr109467745ab.4.1757438780266;
        Tue, 09 Sep 2025 10:26:20 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f10a1e1sm9912093173.35.2025.09.09.10.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:26:19 -0700 (PDT)
Message-ID: <72dd17ad-5467-49d3-9f40-054b1bf875d5@kernel.dk>
Date: Tue, 9 Sep 2025 11:26:19 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] b4 dig: Add AI-powered email relationship discovery command
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sasha Levin <sashal@kernel.org>
Cc: konstantin@linuxfoundation.org, csander@purestorage.com,
 io-uring@vger.kernel.org, torvalds@linux-foundation.org,
 workflows@vger.kernel.org
References: <20250905-sparkling-stalwart-galago-8a87e0@lemur>
 <20250909163214.3241191-1-sashal@kernel.org>
 <20250909172258.GH18349@pendragon.ideasonboard.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <20250909172258.GH18349@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/25 11:22 AM, Laurent Pinchart wrote:
> On Tue, Sep 09, 2025 at 12:32:14PM -0400, Sasha Levin wrote:
>> Add a new 'b4 dig' subcommand that uses AI agents to discover related
>> emails for a given message ID. This helps developers find all relevant
>> context around patches including previous versions, bug reports, reviews,
>> and related discussions.
> 
> That really sounds like "if all you have is a hammer, everything looks
> like a nail". The community has been working for multiple years to
> improve discovery of relationships between patches and commits, with
> great tools such are lore, lei and b4, and usage of commit IDs, patch
> IDs and message IDs to link everything together. Those provide exact
> results in a deterministic way, and consume a fraction of power of what
> this patch would do. It would be very sad if this would be the direction
> we decide to take.

Fully agree, this kind of lazy "oh just waste billions of cycles and
punt to some AI" bs is just kind of giving up on proper infrastructure
to support maintainers and developers.

-- 
Jens Axboe
