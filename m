Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDBE84FA7
	for <workflows@vger.kernel.org>; Fri, 23 Feb 2024 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708718522; cv=none; b=GxZD+jL565T8FuQHpz+kQb+T4xV5hr7LNzHIQyIqWzj/zFppSfihcdeFqjM+VOAR32DY+CGhLNhrZ5lDWcComPDMpEq2zf8NL+CjtruDOTzeRjGNEH4aEHeaN+9Uxvzyv8XtmYBXJZ/BB6zdjEYRnvEwCDp7lUaFb61xv+kENgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708718522; c=relaxed/simple;
	bh=Ntr6kxqmO19hLr+yswhVs4whrMXXtao+RbipMcLJBz8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFXC5YeL8M1PotfgIcunCzXDvgZVgYwTn7rLSOsIruTgv79B19ZLEYodWXwmHODAUrXHW7eiFwGZCDDG9ZamqCO5JQFUf1Iw8r5ouBx0ReIvRBMLzXjyeiqpy0EDAoQfeoz/tgg1fVp875Psut9h0KnUbJHlu+wnaAkMfMxYdz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpKeuqHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpKeuqHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23E7C433F1;
	Fri, 23 Feb 2024 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708718522;
	bh=Ntr6kxqmO19hLr+yswhVs4whrMXXtao+RbipMcLJBz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NpKeuqHb36x5h/BkOT36fWOEtLNEiPQ9OYZ6YpI4WwZvjkDBPBkMjVSp39ZAnq2qm
	 7gVOuyJOibELQpAUZ/Pke91BWrw2fyobZ7ycJcBWv1Yihb202oOafM+rXIGkueeU8a
	 96EoJX6z6uBqaufo/Zc1mVPZUiYHdRMRXHrdKQboabzILMKMsDMiHcPPFsRc7/HIy7
	 IYR8JK/O0tE4ewne6KXHH+hEESMZiVSOSQtaBJd/Psft6kVS5/jTRFmRYI6gAm5mu8
	 T5yYglCj22rOQ7CTFy+IDeTM7sMZYXGEBaENyY0eJB1xoxSrmB+nm/Y+GDHmPz+CxI
	 MCdlbsyeVJvwg==
Date: Fri, 23 Feb 2024 12:02:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, ast@kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240223120200.2e04dd3d@kernel.org>
In-Reply-To: <87sf1j6pg0.fsf@meer.lwn.net>
References: <20240223083154.4fbee63c@kernel.org>
	<87sf1j6pg0.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Feb 2024 10:49:35 -0700 Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
> > Does anyone think that even non-intrusive analytics are a no go?  
> 
> What sorts of analytics are you looking for?  Simple logfile analysis
> should be fairly uncontroversial and would tell you which documents are
> most of interest to the AI bots^W^Wdevelopers. 

Yes, basic analysis of access.log would do. I think that's equivalent
to what Plausible does. More of a question of what existing solution we
can set up quickly, but have no preference on which method or tool we
end up using.

All we need is hit count for a subpage, with some basic dedup of
a single reader hitting refresh...

> Anything requiring, say, javascript in the browser is likely to get
> blocked by the kinds of people who might be interested in kernel docs.

Interesting. I spent 20min grepping the netdev's access.log.
This may be confirmation bias, but vast majority of the hits
are more or less thinly veiled bots. Unless we believe that
someone from an Android phone decided to visit "admin.php"
after landing on our page... (admin.php obviously doesn't exit)

I zeroed in on the following metric - users who came from patchwork
(clicked on CI results) over the last week. Plausible -> 17,
IP addresses in access log with the right refer -> 18.
The dates in logs may not match up exactly so the small delta is
expected.

After doing this exercise, I'd like to withdraw my previous statement
that "access.log analysis" is fine. Now I think it's far more likely
we'd miscount bots than that someone legit has blocked javascript...

> We did an overview of relatively innocuous analytics packages a few
> years ago:
> 
>   https://lwn.net/Articles/822568/

We need some analysis of how much of an email people actually read :)
Look at the second paragraph of my first email, where do you think 
I found Plausible if not LWN ;)
