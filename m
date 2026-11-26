Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699847;
	b=nBBlbW/ePUqK8Lily7Kkk/YVynwLXo8nJN7HTIxvZGy0B7p4AYSR+dk/vKM9baiB0S/+
	 RSR55Lx7RqR38SBxsdHKiny3Pc0ub9uTvXz7ILRbGsK9g9GZp3Be8TtVwrk1XNvLHV+xi
	 4fvGmhdWCcHDG7xKx5rc24MsBhsPVRhUUYfD387VdDbZPBUCyZlif1ET9xi+TkEH7Gfkt
	 tKw/nsYxn+CIp7klNr1gfZyxsPJGSgJUUgWc8/eNaoYifedPYUGjzuO98k+usYCEUJXuo
	 9KmNkI4DpyblBhpS0NQPlpP45bfLEyGrcf/CPsB9AsgUq0S4jjnIJaLBBD392/eE+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699847;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zOIhpcrHDk4x1vWTBQC2/gfbInucSTsbD9vLVGZsjZg=;
	b=xVysJyvmNYpH0XItdbBNog+5cCVlyYFQnQZ+/fxC13fl2YgVRh81jsfMF6f3Mj6Z0bS2
	 3WM8P9uuPeQjazERKN9eNSkhB2dLR2/ae2nx+Pw5o26xSPYQPbWgBKCoHpv21EebVLC9Y
	 mTEblZb22dIctDppqNsKO5yoHonq+VAoe/IB7eciwjxVpV3fwej+IMC/8szfGtzr34KPg
	 mjzdrQmFjC+iDubzrcMEmEyEUbPReGIOKsjq+4l5l0V7nssGEQNm1cMswX7IjWWGYtyj9
	 dz2PaHppdCK4CTQ7Q0LhfCoFQAPXWoMAgLCffGhC8Cmp8qVwuWMmlAmfB+Se//JV9NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4OPMEg5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BDA606A323;
	Thu, 26 Nov 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4OPMEg5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8A11F000D0;
	Thu, 26 Nov 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699847;
	bh=zOIhpcrHDk4x1vWTBQC2/gfbInucSTsbD9vLVGZsjZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4OPMEg50mXxPnPzEnJgSwk8FIGlA4MuhzGo1VR0ln4mVfLWbI/AjH1TlsEni+avE
	 IcHGstvMw6j+OnUk2eukRuYYhfYkBnbkIVDvvOZJGciEHYeunYTBuFlssC20VzukDG
	 L2ht1VTj00mdxA5681CGS/25KG2T+yvAN1z+C0o/O1I03KBfLBbTVDTfGe1LMTcZno
	 LO7wPNiu9ELw89mXftlQhIaDThVZsC99WcTcdx3Pi+EXHy13LJtWQGwA5S7L+crVt8
	 vVi+i1VwpEWJJ1AIRB+/7zfsME8AVp02qe5CeLcK8Lulwp/AKDN7Gv/wQjifhazHj+
	 4pX0JY8TplENw==
Date: Thu, 26 Nov 2026 15:30:42 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <20261126133042.GM774860@unreal>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
 <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
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
In-Reply-To: <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>

On Thu, Nov 26, 2026 at 01:22:26PM +0000, Mark Brown wrote:
> On Thu, Nov 26, 2026 at 02:59:59PM +0200, Leon Romanovsky wrote:
> > On Thu, Nov 26, 2026 at 12:23:36PM +0000, Mark Brown wrote:
> 
> > > There's more than that, for example when you get something from a
> > > syscall on arm64 you've got five frames before you get to the point
> > > of even invoke_syscall(), and thirty odd registers printed two per line
> > > the values of which are mostly of minimal interest for posterity.  They
> > > can be very useful, which is why they're printed, but can really benefit
> > > from some editing a lot of the time.
> 
> > We can improve the trimming, starting with the point I proposed - the raw stack
> > trace.
> 
> > In my experience, the current Documentation example and the trimming suggestion
> > go too far.
> 
> I think there's room for improvement but I think what you're proposing
> right now goes far too far in the other direction.  It is a very
> definitive statement that nothing should be removed, it would be better
> to do things like call out specific bits that are generally relevant and
> should not be removed (like taint information) and encourage people to
> use faddr2line.

I'm aware that I took an overly aggressive approach, but there was a
reason for it - it lets us trim the text line by line. If we take the
opposite approach and add request for more information, we'll inevitably
miss important details.

Thanks
