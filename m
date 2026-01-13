Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221703563ED;
	Tue, 13 Jan 2026 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344256; cv=none; b=dljEL74h7lxf1FEIPgZ3eXvchnJ3ijvRPEJiuA43xRjRRU0alU+bdJXyHpXIa/Fo8BHqKeRyG88Qh1tPrPgZS4qn3YY/OF8RBLXCk4rgdUPRg9fhec/dGJucJlgT1vxlKglEY2z/N7KWAILwEVu65yrTwWpN9oXz18VQRgsz8Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344256; c=relaxed/simple;
	bh=OS6Xlc2NavHVpQF5AXOJXg4jonR/sgRyrGwnpDxrZsw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2j4XppetsfHz5JZN8k+L3GApzOeGuvuZAGL3FwbpVItzTvtWIJvGkhRfrcT4t9DorsuhOz4S/dzm1v/jg3N78sK/1agsnGXuWDDxRYm8P0R53CKUl3RscHiVY4Q+8FzOU6VeFWrjRKdvKhwGDSNf09Rf9JkcjIroDAayqv57Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id BC395B6B50;
	Tue, 13 Jan 2026 22:44:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id C634018;
	Tue, 13 Jan 2026 22:44:02 +0000 (UTC)
Date: Tue, 13 Jan 2026 17:44:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sasha Levin <sashal@kernel.org>
Cc: dan.j.williams@intel.com, Dan Carpenter <dan.carpenter@linaro.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Shuah
 Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>,
 NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260113174408.3fe7497a@gandalf.local.home>
In-Reply-To: <aWaSQsl8h2wnBjzj@laps>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
	<aWXYi35pu9IHf2eE@stanley.mountain>
	<69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
	<aWaSQsl8h2wnBjzj@laps>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: fbn8ptutbbcc88bmfw75fsn4h93afj8a
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: C634018
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18Bg5wSBjJZUAZ5BYRHIY9IW/Z2UnHjT4E=
X-HE-Tag: 1768344242-648761
X-HE-Meta: U2FsdGVkX1+TZYzQr2Gv6HRBy+bvSfkXRdzc4VasN8nzwy66DVBkNmLwkJ8aQUcxe1bH7FrDrI0jVV6VdOknfgbgL5Gp9D4nWQZoC3DjPNcVAvxhYkJvx15cexFZHNNK0LxXjSR7SZ6rMXpT2/Dg+NGm2Ig+GxbwR0QDgOKLekXRsstUZ8UpJjy4fl1Zo2vmgdI3la4JC3zdtw6WC73qKOXr6nILBqHRhkmGIu9ETHZHk3rz0TH6r75Tcz7sWUtPIfRpqjUmXxFbXxR0GD6RZqKZqQTPGc4wSf6wMCwA9DL74mXkL7i8GzKJvgX7WEgRy0Et2Oxi+M9O8WMvl7OoxQX4jjaEAgII

On Tue, 13 Jan 2026 13:43:14 -0500
Sasha Levin <sashal@kernel.org> wrote:

> >Contributions are accepted in large part based in trust in the author.
> >So much so that even long time contributors self censor, self mistrust,
> >based on the adage "debugging is harder than developing, if you develop
> >at the limits of your cleverness you will not be able to debug the
> >result." Tools potentially allow you to develop beyond the limits of
> >your own cleverness which implicates the result as "undebuggable" and
> >unmaintainable.

Trust does play a large role here. I get annoyed when someone I never heard
of sends me a patch because a tool told them it was wrong but when looking
at the code, the tool was wrong.

Every so often Dan sends me one of these types of patches because of a
false positive in smatch or something like that. But Dan also sends me
overwhelming more patches that actual fix real bugs. The signal to noise
ratio is rather high with Dan so I never get annoyed from a missed patch
here or there.

But someone I never heard of sending me one of these are totally annoying
as the signal to noise ratio is 0 for them :-p

> >
> >So a simple rule of "generally you should be able to demonstrate the
> >ability to substantively review a contribution of similar complexity
> >before expecting the kernel community to engage in earnest" mitigates
> >the asymmetric threat of AI contributions *and* contributors that have
> >not built-up enough trust capital with their upstream maintainer.  
> 
> Looking at recent history (v6.12..v6.18) we had 1902 authors (a third of
> overall contributors) who contributed a single commit. Out of those 1902, only
> 177 have a Reviewed-by tag pointing to them.
> 
> With a rule like the above, 1700+ contributors would have not been able to send
> their patch in.

But were these all tool submissions?

I also wouldn't expect (or particularly want) new contributors doing
reviews. I think "Reported-by" is a much better metric for new submitters.
I trust people who found real bugs more than people that just slap their
"Reviewed-by" tag on something they probably don't understand.

-- Steve
