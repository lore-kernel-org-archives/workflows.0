Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698004;
	b=TcI1fzRF5CnZBYFc1FYewXV/EWUz+6EDvKBhn/4pS2rx3+BkOAWxQuB2CySojIA9cPAv
	 2NoGD/HD85cMm4shcVy8PcbK2nXMbXalkdLxe7Q0kvE5hqzbDcYoIww0abk/sc7YutlFL
	 HQMB3aCALYAg495f8GK1TO8RDthugwgGHHNS73IvvtGqemfE928WD073JhiplBi2Xb5LJ
	 fGPzwNUZ5zacX3WHS6KAcaExatfqPgfchWriGzoF22VO4IuOhu+Ku2MU7BoG0Pj+A8YnW
	 hwJoUgm4VFQHDTIT+zi/o2KradjAoZ7Z4Xx1SIPMkzsj1qbajdrfRyS0V16/fUAZrXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698004;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yN5dnppC/bv/csfwn3k5YormIQ1j2qRTF26GTB4q+t0=;
	b=Ukzv41doCgoWnSYq6BddBrVQu09Ksg9ZIAOTRXp+b3rEQ1Jbo+YHXtmpNnc2bxERyhhn
	 FzpFQThzhRQDBOFl0AaXw8MneEV4j32XbVNoRzApmeMg901iO628BMWYG1kwWizwFTg4E
	 FoRCTtHeEhNUFbm4jFyhD6LTMIydV0bHoCYJ0se3ATykqELkz1Uuayl+KR+hu/5mbiiGS
	 hdIg5aAUJJ0yRy1PysIOPqpQdC4w9g83dv9YTs7f3mQu9yVeWQsN5GG/aMlr9BI+QsNUQ
	 f6KY15an1y9eXTSj4tFohDAWdnU3ODRh6lBnQDv19t5SIYJnWqrA+ACyv7ZVulQI0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeT1tvBK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178F606A31C;
	Thu, 26 Nov 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeT1tvBK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DE11F000C4;
	Thu, 26 Nov 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698003;
	bh=yN5dnppC/bv/csfwn3k5YormIQ1j2qRTF26GTB4q+t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LeT1tvBKuF39PPHXNKIbwrEBD7fAsgEK3Gdbk5H1MasdkLaT2ei524MXvbOcfBxJb
	 iBVTa18eleKYPkcKXIHHoHwbeMDIR6akUX2hgxR9juinG8ypBeqAXa872cunYPrsDK
	 ivQ03HsIaFRo67sjWIVkAxyGsho8VkU2xNx++/7KQxVbuzjnMT4WM9rlDxkJgkSphA
	 50wX1E5Shtp+ZWsjlnqCe9a+nRtAkGzqg5tQOL47RSb8QMLHS23aZykzPLZj4/c2lC
	 3AU2C1E1UPHkeM1Lw33D7P3rJmOBGExLnazAxgBpMDAGsidMli2r3iS0hoyuyHiS+G
	 NL6H51KLqCZzw==
Date: Thu, 26 Nov 2026 14:59:59 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <20261126125959.GL774860@unreal>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>

On Thu, Nov 26, 2026 at 12:23:36PM +0000, Mark Brown wrote:
> On Thu, Nov 26, 2026 at 10:12:08AM +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> 
> > AI tools tend to trim backtraces too far. Taint flags, module lists and
> > module names disappear, which hides that an out-of-tree module was
> > involved or that an in-kernel API was misused, especially a driver API
> > that is not meant for general use.
> 
> > Ask authors to remove only the timestamps and drop the example, which
> > shows a trace reduced to bare function names. Timestamps are the one
> > part of a dump that adds only noise.
> 
> There's more than that, for example when you get something from a
> syscall on arm64 you've got five frames before you get to the point
> of even invoke_syscall(), and thirty odd registers printed two per line
> the values of which are mostly of minimal interest for posterity.  They
> can be very useful, which is why they're printed, but can really benefit
> from some editing a lot of the time.

We can improve the trimming, starting with the point I proposed - the raw stack
trace.

In my experience, the current Documentation example and the trimming suggestion
go too far.

Thanks
