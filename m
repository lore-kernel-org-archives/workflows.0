Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A5221ABD7;
	Sat, 13 Jun 2026 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781330824; cv=none; b=SwWdR+IbNfn00VdyyV+y4DTKdSp+kX4GnrB1mjTuc9J+ibTCfj5KHLeUTri/+Es0GfxDVuYkKhBSTC429lwOsiboyXLvEpsYCPJywCb5E/bd5/O8aQsXxKK9hq/VWqbzx5u4sgDSzLC4KrzaKjho6CO+V8Pr/V0l9hEayVpAGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781330824; c=relaxed/simple;
	bh=Syw7ULXdB5dW8ZcIfM7qGgtXBrTWdNGVXAYsbJq7l1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Msx0Ylv8PbiL0ejvsauNdmxEvSCvu4e87KmAo0+bJ0GO+KhcPmd051fLVaXpdn9vsVMDpxBPFf2o+2Ap5rV/zQ4bbM7P+7+CmKYigxEFBJUg+zBZZbGAsf+iO/5CVtbe2VU2dDezrQjjiv//Gx6DqcMxtPkUP9wiQE7UZQLxsmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M880zC7u; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M880zC7u"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781330818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Syw7ULXdB5dW8ZcIfM7qGgtXBrTWdNGVXAYsbJq7l1s=;
	b=M880zC7u2byTFN+N4Gq3ygEGJV6uJ/y323l98Uq2VwiDsDKwwbe3KSZIsE6fswnZXAIDQM
	ncME5PeWmLbP9V5sIdSHUE8XEIhJI9+8OEhIAu5FhcUJagvyZNVQOVT5s3ZSRIrP6Q0Swr
	Ebk61m5Zsus12EN++gCjPlzL6R/lrYY=
From: Lance Yang <lance.yang@linux.dev>
To: dev.jain@arm.com
Cc: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at allocation time
Date: Sat, 13 Jun 2026 14:06:37 +0800
Message-Id: <20260613060637.40039-1-lance.yang@linux.dev>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
>Introduce a boot option to tag only at allocation time of the objects. This
>reduces KASAN MTE overhead, the tradeoff being reduced ability of
>catching bugs.
>
>Now, when a memory object will be freed, it will retain the random tag it
>had at allocation time. This compromises on catching UAF bugs, till the
>time the object is not reallocated, at which point it will have a new
>random tag.
>
>Hence, not catching "use-after-free-before-reallocation" and not catching
>"double-free" will be the compromise for reduced KASAN overhead.

Hmm ... do we also need to teach the KASAN KUnit tests about this mode?

With kasan.tag_only_on_alloc=on, free-time poisoning is skipped, so
some UAF and double-free reports are skipped on purpose, but the tests
still expect them :)

Cheers, Lance
