Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3371A3750CF;
	Fri, 19 Jun 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874295; cv=none; b=EOzfKVenTwL7SDxRTN0Yll/h4D9Z0uIaa1gx65jxvsCuOPkTvsLhCbvatKwUZcHb0d4AxzcXNoGRom0y6aRByx9YW6po6PZKVH0yjAll97KyejXNK2KTnzNOND+KWqVe+rdfPZ4ZLhlrEYVQqJ6XRZAMmkQWlfQA6we2p3orv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874295; c=relaxed/simple;
	bh=e9pfEYbv59UVNvg5pd3j1Yh0i55qXWOlAw6aQXf2fiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYatG47jNTsPTcVTYsX36GGXGNaJZCbXk1HQWu8ZBJMJtTaUI/IW2nlFlIWwVn6r93LeKK0zCOYKUSF6YCi3nJxryMU8uZ5mShojJS1MTLoNO6oxh7S0Iq5VoaCV5hYnbdYZIgEEYQOtz7GjzYVEkY1Rgj/ZuRgMfEmGTYf2EyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lQUOPpbA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lQUOPpbA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85D24A92;
	Fri, 19 Jun 2026 06:04:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4AD3F763;
	Fri, 19 Jun 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781874293; bh=e9pfEYbv59UVNvg5pd3j1Yh0i55qXWOlAw6aQXf2fiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQUOPpbAmN6Zr1EYJgextc9Lnki8Ehn68EA514fFROJG93hMv4r2Cfa/r8NEkWg3n
	 w7/Zq2/WnP0TUUTs/hsA6wrxV4sm6R2stNIFSF+9iXhA2oqOiIZLzOIr6XQovIdoEu
	 /E9iWQPaERn1E4Z9+FmbsevKh/DyS57CcpVOvJzY=
Date: Fri, 19 Jun 2026 14:04:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajU-b32dmwS7XOg4@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>

On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
> On 6/18/26 10:35 PM, Harry Yoo wrote:
> > On 6/12/26 1:44 PM, Dev Jain wrote:
> >> Introduce a boot option to tag only at allocation time of the objects. This
> >> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> >> catching bugs.
> > 
> > I think most of overhead when enabling MTE comes from loading and
> > validing tags for every memory access (either in SYNC or ASYNC mode),
> > rather than from storing tags.
> 
> Is there any reason not to use STGM instead of STG + DC GVA when
> setting/clearing tags for large sizes when we know they are properly
> aligned?

STGM is intended for copying tags when paired with LDGM. Have you seen
hardware where STGM is faster than STG or DC GVA? For properly aligned
buffers, I'd expect DC GVA to behave at least on par with STGM.

-- 
Catalin
