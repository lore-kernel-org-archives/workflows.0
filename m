Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0F8BE7
	for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723660; cv=none; b=KB8wEXIt9gb9PvJl1dlbER0ymPlKo9+ECc4/J3mXZN98jJZip5nOXY2wc8HG1BNFPfzTQOfZ+zpAK3pCZppglXM9uG8G7K5Lo9HYgb3XRrR6Zg26ZjgZgmt2SCLnLe/YtvwnsiPgm7aBBSp8PnS19MEMXiR8BPLJg/ltY1LGXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723660; c=relaxed/simple;
	bh=XqSXfaeYkHMa0uyMmCXgrjLlTezxa7CtAQWxJfRf2jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seScs7bE2Cz35DJGghguQJ8EtJR5xiji3L3K8VksKnOWz6CKsFOM4eDv+kQJtafc672xUeUE29rrIihhgulPTn0mQQmKJhRPqjfv1ETfBO9FJT/D12aMga/1XI65VecKR2CIjzMrSu1hlvCBha35r71lPGdVp8i7jxJ96PprwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kb28bA1Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kb28bA1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737723657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo3fTWya9tHycVPx5tFin/qFgljd4EcPY6jTqMY9tdU=;
	b=Kb28bA1QHMrxWBuiHNiQuOhx2YsUYIn/FiJguQIEc6RRzFzL2pz27ppRBnY6PKEVdOwcIX
	vIsHFDDaON+PQBY5K9KUPDODrinF331C/idy7rzLWdyaQwXL4Ddwv3p1EqMtCQBO08/6J+
	9xYoi7U+1w5kQM4jRsiC9bgQOTfMgRI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-wV4EHdhTPdGuCheFJE4kaA-1; Fri, 24 Jan 2025 08:00:56 -0500
X-MC-Unique: wV4EHdhTPdGuCheFJE4kaA-1
X-Mimecast-MFC-AGG-ID: wV4EHdhTPdGuCheFJE4kaA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d7611ad3so1136442f8f.2
        for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 05:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723655; x=1738328455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo3fTWya9tHycVPx5tFin/qFgljd4EcPY6jTqMY9tdU=;
        b=GAGw+DsTaKkAzmAh1+7W7FhULLSPNWkFcve58D1DsxH1AQSvLENG4yisP6/pcvJsAf
         SrzXgHXnTRSD3hCVkcINsw6iasbqNlLcymmykL5pX7ejVCC1OAHjWb2l0C6QD+eUar62
         RHqRD8y9wlmyDMQeTgiW359Dc5NcoxOrCqT9cMT/lv8+2mhUtE/wktw6Fc3SfsfL2paF
         KbdDN3zIQgJGQmMFpxWoNmxSr35lfL0UtkuLuB3DrYTacmNf8A31CLQzhVBWJlfjopcB
         Wfb76JVy1tOxbACJso+h//eN+Q3Z36zroWw9SsfJc52pDrVrpr8jYCEVUf/aOaWduzfu
         u5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLtVJ2Cxp0CX8CzmLz6gVEy0YgqPWRQpt2VUjPh9tF/xC3X8PIYZ3JyQtWC0pjhOtB05kuIjxhDfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8U2tRnlVKS/IUrMEAA/NQ1KP3/dPr2K2ODlz4gWGRXKzmS6FN
	/5umjPIQ7swXVqjIyjf+OqEJ1UNRnpclz780mbEy9KWmRoVZ4TJinnHyhAWm6KtmkDMJyhrLYsm
	rNb7yPug4ygQ72pet1ZZ4YBIkRE8CS1CUXBvjbRpZ9SZsI37kryx85p746g==
X-Gm-Gg: ASbGncsZiVz8qSZ8VjgfYzS1YzCJwP/jyM4U8VHRVyvggZ2VUulD/vZnAbJ8DuMJFD/
	q+UIVi336XrHukT+7T00iPZiOuNtQNvtXUejDpp7Cz1Qozk13nTlR5sd8zU4koCrEXJs3lfYEhV
	lxNrFYXgeZqWHNzpl1tV4gLpw1EbIYNnHuCwtYzU8qsMreT1rT6IHHjc/mqgEF/OP944iRiQoXI
	ug6NSNGaiqt2UsJ4GNTrYYm6+LJANtBKfEgdBgyeGybyijNnbUSPEUeV1iuMiqPxz8ctcm5XW5m
	8XEeJ59UeMIpwrZY/4RSuer0xuKdd9MtfoPI86oXFuuZXA==
X-Received: by 2002:a5d:5f54:0:b0:385:fa33:29ed with SMTP id ffacd0b85a97d-38bf57d2cc4mr26674310f8f.47.1737723655052;
        Fri, 24 Jan 2025 05:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7O6kDxKgj8QXof6pkh0HnABdfU01AfCfVNwm0lMd0ZfNC4JqKT86eG7V6rVx2a63lUIXoHw==
X-Received: by 2002:a5d:5f54:0:b0:385:fa33:29ed with SMTP id ffacd0b85a97d-38bf57d2cc4mr26674235f8f.47.1737723654623;
        Fri, 24 Jan 2025 05:00:54 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857cesm25657015e9.13.2025.01.24.05.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:00:54 -0800 (PST)
Message-ID: <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
Date: Fri, 24 Jan 2025 15:00:51 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
Content-Language: en-US
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/24/25 2:16 PM, Jarkko Sakkinen wrote:
> On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote:
>> Gitlab as an open-source software project (the community edition) is one
>> thing, but can we please avoid advertising specific proprietary services
>> in the kernel documentation ?
> 
> I don't think we should have any of this in the mainline kernel.
> 
> One angle is that "no regressions rule" applies also to the shenanigans.
> 
> Do we really spend energy on this proprietary crap to the eternity?

This is not getting included into the kernel itself, the contributed code is,
of course, open-source. And yes it would execute just fine on the fully
open-source community-edition GitLab. I don't think "no regressions rule"
should apply here. This is for developers only, and is a template for making
your own pipeline mostly, with pieces which can be reused.

Nick

