Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB64315CD47
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133766; cv=none; b=AG3CJ/8lVPRerm9adIcANWdtvW/u/VB5Ue6pJ83YYTcVFYe2z1aOXCpAly0/WGHx0/2LmI0KCG2E6JjjG96UmSmmWu69JPDjXkp4Ue93fciidE/liwB5GfkXbDSqeHiXeSTVt+9nxHEv7yEIYAB10h2mFD12fLvWk4DKsfHXTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133766; c=relaxed/simple;
	bh=ZiTgLWbfqOKxeUh3q0lAdAoWMYQV52v6HJ3FFE11IK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkH/Wp64BWhnJpA/qv8EvL/6NE2EpxN3CDl6sp9+WLND/ulFvv8UzIosgB6zNhWCcMZPNf9okNQhIUXzzr22zt9j1l9paUAGWO1EbdKf9FidOBCQsUvMT/FrIiFfeZiDwFSXE/ut46A+a7jFvNUc/heEiY6mBIwmBmXfs1iKHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GKC8fHz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GKC8fHz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65563C43394;
	Wed, 28 Feb 2024 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709133766;
	bh=ZiTgLWbfqOKxeUh3q0lAdAoWMYQV52v6HJ3FFE11IK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKC8fHz9dAHnYyW3PiJAcsI2DPYPLn2WoLmaqtgTTSih1SzABAZHQLB+RVObIzCvg
	 TqiFmumI/ILlixSdAsdtYa4Lc7Yf23dunctJmOYJOrWoNUUIri6Yx8qisY6BRkoZUc
	 uL35KocaibRduGxfpJyJrXz0Uj9F2w7gLhX8EawE=
Date: Wed, 28 Feb 2024 10:22:41 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, users@kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>

On Wed, Feb 28, 2024 at 02:03:31PM +0000, Mark Brown wrote:
> > I figured a number of shortcomings about this: I suspect that those
> > most interested in such output are either, a bit like me, not much
> > active on kernel development, or focus on a specific area and mostly
> > want to stay aware of ongoing changes in other areas they're really
> > not familiar with.
> 
> I can imagine using this sort of thing for the case where I get to my
> inbox in the morning and there's some enormous thread appeared overnight
> with people arguing and I'm trying to get a handle on what the various
> subthreads are all about.  The demo didn't cover exactly that case but
> it looked like it might be able to give some sort of useful steer.

Another use for this that I could think is a way to summarize digests.
Currently, if you choose a digest subscription, you will receive a single
email with message subjects and all the new messages as individual
attachments. It would be interesting to see if we can send out a "here's
what's new" summary with links to threads instead.

The challenge would be to do it in a way that doesn't bankrupt LFIT in the
process. :)

-K
