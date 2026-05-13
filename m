Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0533542EEDE;
	Wed, 13 May 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676729; cv=none; b=qH3gy60K0wvnIveBh+0wQ9IRcyzn7wOuXQbha8Ua+vTPA1MMLBTpHU/b3kkZyjAh31MvwvugsRq0nKCOVlv6rdt4QoYqLLCdw5HP30ZZa8SpzOlP8LEgv22jG6K15qGOMBNaKbumYYpOd1GZX0kimOemVsd9Ang7kvrkmCYjK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676729; c=relaxed/simple;
	bh=Vkvv35opg1IPDd4F6/wrCge1mjBkQU847XSlfpS9h28=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fMJlCh9/lwX59hZiAsFacQ7sF0TfgNMVnpKciPvM0bekKz7mYmBjZbopK4vlCXhIp+xeAXmp1K2BBEr0cZT8kaQ+QXKdzxSrC4Ld1K3+R1XS+UFUP+b7/WrU5AI75e2mpoZIGMZ2+S9Uv33jRnKc+JqnTIJm+v7mXC2G/I0LnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tCfMD06W; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tCfMD06W"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 752CF40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778676721; bh=LMUPi4ipoaHoPeHvXPr/aJORnzkpeSgTk0Rd3Bd3oSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tCfMD06WWX0e77pfFMctCtWwQ71j/1qKEa4p904oyKCIWIAJhZqzwjjDKtxv+y5+y
	 jW5s/+cSM4PZpD2qjoVkDeD4SxYJahnPhVPl4HIW9eywQb5OdG0x2myxUx+RGLDVLb
	 ARNDCDOZxRgnlAY6sfLSIuBEB6TEhVUFczMUrJTZBdVdu864DX839TUf63cXvsXuL1
	 XUgc+QW5e4oyX3o+vyRx5fh0z3EcpGFPWeIqEzO/4O5YLzuucKAS6q8CVWl49GuOE9
	 2VIYujV06zF1hOnCRAy6BokmJJqGy8x3I4HhANxfK7gh/MO49HWlN6fzEJmnAP2SOi
	 WjEUtCeOqYV1w==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 752CF40C7C;
	Wed, 13 May 2026 12:52:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agRfFoMC2Gcu0Esz@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh> <agRfFoMC2Gcu0Esz@1wt.eu>
Date: Wed, 13 May 2026 06:52:00 -0600
Message-ID: <87ecjfmpzj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> On Wed, May 13, 2026 at 12:29:34PM +0200, Greg KH wrote:
>> On Tue, May 12, 2026 at 11:20:51AM -0600, Jonathan Corbet wrote:
>> > Willy Tarreau <w@1wt.eu> writes:

>> > > +* **Capability-based protection**:
>> > > +
>> > > +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
>> > > +    kernel's configuration, memory nor state, change other users' view of the
>> > > +    file system layout, grant any user capabilities they do not have, nor
>> > > +    affect the system's availability (shutdown, reboot, panic, hang, or making
>> > > +    the system unresponsive via unbounded resource exhaustion).
>> > 
>> > That is pretty demonstrably not true, and will likely elicit challenges
>> > at some point.  There are a lot of "make me root" capabilities that
>> > enable users to do all of those things; consider CAP_DAC_OVERRIDE as an
>> > obvious example.  I think that just about all of the capabilities will
>> > enable at least one of those things - that's why the capabilities exist
>> > in the first place.  So I think this needs to be written far more
>> > generally.
>> 
>> You are right, there are more capabilities, but we get bug reports all
>> the time that basically come down to "a user with CAP_SYS_ADMIN can go
>> and do..." which are pointless for us to be handling.  Just got one a
>> few minutes ago, so LLMs are churning this crap out quite frequently.
>> 
>> So any rewording of this to prevent us from getting these pointless
>> reports would be great.
>
> Honestly we're seeing this through the angle of a patch that lists a
> single paragraph but the doc is already becoming quite long. I'm a bit
> afraid of adding long enumerations, or sentences which do not immediately
> translate to something recognizable by reporters. Not that it cannot be
> done, but I think the current situation warrants incremental improvements
> by fixing what doesn't work well. And indeed most of the capabilities
> based reports currently revolve around "I already have CAP_{SYS,NET}_ADMIN
> and ...". That might remain a good start for now.

I definitely wouldn't argue for making it longer, and enumerating all of
the make-me-root capabilities would be silly.  I would consider just
replacing CAP_SYS_ADMIN with "elevated capabilities" or some such.  That
might rule out legitimate reports where some capability provides an
access it shouldn't, but I suspect you could live with that :)

Thanks,

jon
