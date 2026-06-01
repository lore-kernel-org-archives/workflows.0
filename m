Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317B361DB1;
	Mon,  1 Jun 2026 20:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344810; cv=none; b=a4xDwyuHmSpK+8DR3pZjGSkdkZW4XLuxvvuPjpCNsZF8HuAAfTcSzVFSXPyHb6RVkluxFUzMX11GTs49TRsvmkNCsAd3IsygCPLS6SGWmCWhPlC38yyVvILEQ5SsrxFNMHsZguH51mSYKrj2i7ENYFiOrqo12MuADOk40RR3HY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344810; c=relaxed/simple;
	bh=wKK/FzbNaED5xvWFDJiAwBCFYqz6McxNd+D3vKaPWJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxlBDEExE5jusoDNftI6oHZ+TJtSzOvaHZocOkagtGqnl1/6mDtmBISbXoePRo1CVbSPKZ3hyAMlHf6qgKhTdS8PDFha6YqEQwRECsBSNCUDLO3tgcG7fsKB74GQbftncngFdfJxRIAfOBVkyRaYEYHI/Wf56vAfJzwOpBKIKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkY5+WTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkY5+WTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C3D1F00893;
	Mon,  1 Jun 2026 20:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344809;
	bh=F9AJGNKKMYq2BvmnWxh/UJoaEgC9RUbIXvoINjvIS2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jkY5+WTTWa3WOG2BWOZw22jlwVujRf+IxQwNLYr2U7K1bhsSH/HMwdap/RVjb0KiL
	 87TdcCEfntq1xu9oX8v8lKmicPIRK2unoKyBls63hxUEql5eCR8+0Kt9KmkYhYRvBt
	 d2dW8dHBSYx9V4AtLHEOe7F+na+u0azLKHzoUZS+HN02oWtJdCxSPzqWcfq4osCHPy
	 mOmt9JqXAXPS+s+rwk2DVDD9xI9BcVykVUXFDlfs4uYFKDRbqkSsw9iXEtN83712RL
	 52LB0wPpMLMzzP8H74p6cqad1mSlI+dsBJR7e4qaKgfLkXwNBN+wo1nX55US0+BgXS
	 +q8XwMdSRoOGw==
Date: Mon, 1 Jun 2026 16:13:27 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: mo to <pitar21@gmail.com>
Cc: workflows@vger.kernel.org, tools@linux.kernel.org
Subject: Re: Proposal: preflight checklist/lint for AI-assisted Linux kernel
 bug reports
Message-ID: <20260601-enigmatic-gleaming-chital-12ff4c@meerkat>
References: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>

On Fri, May 29, 2026 at 10:09:37PM +0900, mo to wrote:
> I understand that AI-assisted vulnerability and bug reports have
> recently become a burden for kernel maintainers, especially when
> reports are duplicated, unverified, or lack enough technical detail to
> be actionable.
> 
> I would like to suggest a lightweight “preflight” process for
> AI-assisted bug reports.
> 
> The goal is not to replace the existing Linux kernel email workflow,
> nor to move kernel development into a web-based ticket system.
> Instead, the idea is to add a simple validation layer before a report
> reaches maintainers.

This is generally along the lines of my suggestions here:
https://lore.kernel.org/ksummit/20260402-expert-maroon-partridge-f77f94@lemur/
(see under "new bug reporting")

I've done quite a bit of work on git-bug integration already, but I had to
step back to refocus on the infra again as we deal with upgrades, migrations,
and new kernel reboots. I hope to refocus on this work again soon.

> For AI-assisted reports, the submitter could be required to include a
> structured checklist such as:

I think if we *require* it, we'll never get any bug reports, because the
process of getting all of the below information is daunting even for someone
who deals with infrastructure all the time:

> - Kernel version:
> - Commit hash:

This is not easily established.

> - Architecture:
> - Kernel config:

They may not have access to it.

> - Affected subsystem / file / function:

That's often not obvious even for people who wrote the affected subsystem. ;)

> - Reproducer:

This may not be possible anyway, depending on the nature of the bug.

> - Reproduction rate:

This suggests a lot of effort spent on narrowing down the bug already.

> - Full dmesg / KASAN / UBSAN / lockdep / syzkaller log:

These are huge! Definitely not email attachment material -- we have to figure
out some place where we can store them, in a way that won't leak someone's
private info all over the place.

> - Checked latest mainline: yes/no
> - Checked stable trees: yes/no

It's pretty optimistic to think that the submitter will be willing to go that
far.

> - Checked lore.kernel.org for duplicates: yes/no

How would this even work? I'm in charge of lore.kernel.org and I'm not even
sure how I would check for bug duplicates without having to manually read
hundreds of entries.

> - Existing patch found: yes/no
> - Why this is considered a security issue:
> - Impact assessment:
> - Suggested fix or mitigation:

These usually happen late in the bug lifecycle and probably won't be relevant
at the start of the bug report process.

> - Human verification performed: yes/no
> 
> Reports that do not include basic information such as a tested commit,
> reproducer, full logs, duplicate search summary, and existing-patch
> check could be automatically rejected or redirected before maintainers
> spend time on them.

That would be awesome, but that would basically mean "zarro boogs" every time
you check. :)

-K
