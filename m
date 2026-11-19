Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087203;
	b=KIfcwiyS4gLhuvIyUsvKgbyGclO4BtScj9ojhKNLDM0Ton4lhLYqfaW6weNio4nrTiLf
	 AwLRAVE47I2fn5JQXeFJSjIXZInfD72DtMBG0afiv8Q0aG3X1LHmo/NSfjX3CdBCYZBp0
	 paLjj38hT7n1zTtm8ckk/1HwGgF9g6SavntD+xG0diHVZFq/RDsg2o6SkZPjRfzpSO+jA
	 3kK+w/PLHSYs6IUBzTTUoEFmwVPoHyyR+0xrrCWIERIJGzcq9EPcdtQmMh0+1FrcWnyYn
	 9xhvfeQGoMUNIOVQiNukGkjRDTPfOzzo2OTbDemyr4MJvpWuRm9CMTSVKOWNO6+DRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087203;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0lZy5Q1OsDVUhCutJzT/3gh0V7EBO4C8UutDkYNq11o=;
	b=iaF2eoIULZ32mC3eTwG3VCgRid0KM970kaw2HBx6Wxd6ZKQ/3A+7d8sI18lIchUe+ObJ
	 KJEX2p/9ClI7rAG1hhmpifP5HLNcUSOg+Aos5HOKJ3715ym0tUc259bPuWES1TYWOnfkE
	 kt+yNa6sXx/yuljaGJ3Xcw15U97jJ+fjIfiUAL5Ipx7oQeLfO+LOI+0CaNlF6+nVpv5SZ
	 RgPvpR8vEraqO7rtJmlhgUUAfzgzT/EJO3NjptR2NHBHk2SxkdlbPO/MOGC+HCm/sVHZZ
	 zV4mH1WsUuc2zMpdyE3LXTM16IiCX5CgZfagbbBWLVFVJfHAtYIhl9LCSagKiLcb24A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKRgDEuS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A4606A32C;
	Thu, 19 Nov 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKRgDEuS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EA51F000C4;
	Thu, 19 Nov 2026 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087203;
	bh=0lZy5Q1OsDVUhCutJzT/3gh0V7EBO4C8UutDkYNq11o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AKRgDEuSILoTXEwSD30s3+d4PKpy1OGTjiSsB7iXBVpbdxX1OjNu6Is4iMDIz32Sp
	 u7624UdraK74VX/+CMkyzcvDxQdLQOewTDAtUv7R3gVMDAwApuqU3bn3gYSPbSi55H
	 428DeLnHo1E5mCXgtbQ8OIRhPMvec98wH2x4i+o7pqytpuUwJiHzRWRt+EywBDaDbp
	 UOQRh8j6d7Y71Kcn03I5XSui8ebqXthltW2F8/PckQ/e86A+9bsjIO6M+GxRgRUrz5
	 dJRuchLWT8lrdhbXuYeEGYPpWnrMn8ho21VXuK1cZWmIcGC0+eD0/fFROTgYLNpjkJ
	 nFJFmIHQMQgaQ==
Date: Thu, 19 Nov 2026 13:19:59 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261119111959.GI162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>

On Thu, Nov 19, 2026 at 11:29:36AM +0100, Geert Uytterhoeven wrote:
> On Thu, 19 Nov 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 17/11/2026 10:27, Leon Romanovsky wrote:
> > > Since you're already making changes in that area, could you add a sentence
> > > asking reporters to provide the full dmesg stack trace?
> >
> > If so, then trimmed. We do not need all addresses and registers and the
> > [time markers], but rather the calltrace from decode_stacktrace.sh.
> > That's often review feedback, btw, people just paste huge bunch of dmesg
> > without thinking what is useful there.
> 
> And full build logs, to prove their patch built fine:
> https://lore.kernel.org/all/tencent_684DDE3E94F7C2470E5E02BF79AB1A1DB906@qq.com/

This is more of an anecdote than a real issue we need to worry about.

Thanks

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
