Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF96F1F1307;
	Fri, 27 Dec 2024 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316371; cv=none; b=efFAyvB2VMGxZxyCZUbo8K9K6fp1pVoD9TeuRTIfQ6GVXWXulQiga343VZbB9a7vMrFQzCyKh0ttxqn9ThMjPeFmYHpPjdgseKsOKmowGExhIYDf4rtJcdi1WrRBKFObyS2CdD6wf5X+xsYdssEuH4pVOkNtQMWABSSTLPrGhJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316371; c=relaxed/simple;
	bh=Ym+Dt1ptnCi9AzASufh4Np73zfjVjRwO0prNtz4f8Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfREdjWBjBxK2aC8dnFexli3mEDy4mNipww/LoZiwosC0Qs4vU3Ayk11ojeV9P5eqdM8g8WYVxf3xIIq8WBob4xCwWZ3R/rKiQglHubN5B4NXGR4OmWd7XML8zjyNROzJL/XwTqRTOFG7dfAAj5DoKwg1BJ9IZcrigaR6Onm6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcYhcvdy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcYhcvdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F19EC4CED6;
	Fri, 27 Dec 2024 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735316371;
	bh=Ym+Dt1ptnCi9AzASufh4Np73zfjVjRwO0prNtz4f8Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcYhcvdym7I+tdTLH5M3PxSBTzuVomniXIrkUP91Oxg+xDOgFslTj8GQ2fidVRL8n
	 Xt+MiM+rNcufGh48K2KyOBfOKAr478TRDkni2r/ZLqm8M+hCS8tkJ9W+4OVwJDVJCr
	 QnpOX7jYGPuFVxS7BuKZhRNe47wQomEb2lzE/M6favjA9JVNqxRWPdTOu8FubhmfAP
	 yOQ54rmVEyxWc4lYI6pnB4EbIEYoy0T6Hh73o1NZMIJRhkTvM7q8RofkUgXrlMSNac
	 oTQuvaYUEnpf6i2b5wzK3pNPXUbrzRbUQ8wszAxwzeH2l0C6QxJsayt5XSwuHG7PqH
	 PKr2PW/CQ9VFA==
Date: Fri, 27 Dec 2024 11:19:29 -0500
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net,
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com,
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@leemhuis.info,
	lukas.bulwahn@gmail.com, miguel.ojeda.sandonis@gmail.com,
	niklas.soderlund@corigine.com, willy@infradead.org,
	workflows@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
Message-ID: <Z27TkUSmM1sCTslO@lappy>
References: <20241226220555.3540872-1-sashal@kernel.org>
 <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
 <Z237CwC_YKhoZubs@lappy>
 <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>

On Thu, Dec 26, 2024 at 05:50:22PM -0800, Linus Torvalds wrote:
>On Thu, 26 Dec 2024 at 16:55, Sasha Levin <sashal@kernel.org> wrote:
>>
>> What got me worried originally is the example Kees provided which
>> creates a collision of a 12-character abbreviated commit ID:
>
>Note that you can always create short ambiguous cases.
>
>And in fact, since the way you create them is to just put noise in the
>right place and brute-force things, you can also always make sure that
>the one-liner short commit name will match the target commit too.
>
>In other words: just accept the fact that a short hash is simply not a
>secure hash. That's very very fundamental. It's just inherent in the
>whole "we have shortened things to be legible".
>
>And once you just accept that it's fundamental to any short hash, you
>can relax and just live with it as just a fact of life.
>
>> So sure, we don't have a collision right now, but going from 0 to 1 is
>> going to be painful.
>
>I disagree. You need to just own up to how it is, and more importantly
>that you WILL NEVER EVER BE ABLE TO FIX IT.
>
>There is no way to disambiguate the active malicious case, because the
>active malicious case will just be able to handle any disambiguation
>you throw at it too.
>
>So the fix is to not *rely* on disambiguation, and to just accept it.
>Don't fight reality. You'll just lose.
>
>> Are we going to be actively watching for someone trying to sneak in a
>> commit like that, or should we just handle that case properly?
>
>See above. There is no "properly". There is only reality.
>
>Git internally uses the full hashes. And any reasonably usefully
>shortened hashes *cannot* be disambiguated in the face of an active
>malicious person.
>
>If you have some tool that you rely on absolutely to give you the "One
>Correct Answer", then you are already broken. If thats' the goal, then
>all you can do is give up and pray to some random $deity.
>
>Or, as my argument is, DON'T DO THAT THEN.
>
>Don't rely on some absolute thing. Accept the fact that a short hash
>will always possibly refer to multiple things, and that you will
>*always* need to have a human that actually *THINKS* about it, not
>mindless automation.
>
>The best the tools can do is say "there are multiple options here"
>(or, more commonly, "I found no options at all, but maybe it meant
>XYZ").
>
>Literally.
>
>To summarize: If you are aiming for anything else, you are bound to be
>disappointed.

The script in the original mail will handle two important cases for me:

1. The "wrong ID" case, where the the provided commit ID doesn't exist
and we need to look at the subject line to figure out what the actual ID
is.

2. The case where we either get a too-short commit ID that has a
collision, or we just got unlucky and finally ended up with a 12-char
collision, but the subject line is enough to automatically resolve to
the correct ID.

We're disagreeing over the remaining <0.0001% of cases.

>So aim for that simple "let me know about multiple choices", with the
>knowledge that they are going to be EXCEEDINGLY rare.
>
>And then if we have somebody who actively acts badly and works to make
>that "it's going to be EXCEEDINGLY rare" be much more common than it
>is supposed to be, we deal with that *person* by just not working with
>them any more.
>
>See? The solution is not some kind of "this cannot happen". The
>solution is "stop accepting shit from evil people".

Not necessarily "evil", but consider something similar to the UMN saga
where we get "researchers" trying to sneak in commits that create a
collision. Once these make it in, it will be difficult walking them back
out.

>Which, btw, is not a new thing. This is how open source works. It's
>actually way more work to create collisions in short hashes, when you
>can much more easily just send a bad patch that wastes peoples time
>without any hash collision at all - just by virtue of writing bad
>code.

No, but it makes for a "good" undergrad research paper...

>So thinking that the short hash is some kind of special problem is wrong.
>
>It's in fact a particularly *easy* problem to deal with, because at
>least the whole "somebody did something malicious" is something git
>will balk at, simply because the basic git tools will refuse to touch
>the ambiguous hash.
>
>So *your* tooling should concentrate on one thing, and one thing only:
>making it easier for a *THINKING*HUMAN* to decide what a bad hash
>means.
>
>But you need to do it with the up-front understanding that it requires
>that thinking human, and is not mindless automation.
>
>And as mentioned, the most common case of bad hashes BY FAR is the
>"oh, that doesn't match anything I know about at all", as opposed to
>"oh, that matches two or more different commits".
>
>> >and my point is that this is really not about "disambiguating short
>> >SHA1 IDs". Because those "ambiguous" SHA1's to a very close
>> >approximation simply DO NOT EXIST.
>> >
>> >But the completely wrong ones? They are plentiful.
>>
>> Is the concern mostly around the term "disambiguate"? Would
>> git-sanitize.sh work better?
>
>No, my main worry is that you talk about short hashes (and talked
>about shortening our existing ones even more).
>
>When I really think that the size isn't the main problem at all.

No, it's not a problem. In my mind, I figured we could use shorter
hashes in mail message to make it easier to communicate.

It doesn't have to be formal, but for example if we exchange mails about
an issue, and I end up referring to '1d1a ("arm64/sme: ...")' it both
makes the mail more readable, but still someone who doesn't have context
can still easily get to the commit I was referring to.

To me, it's a nice (minor) improvement.

>"disambiguate" is a fine word, but only if you use it in the context
>of "I have a bad hash". Not just a short one. Because the hash being
>too short is simply not the main case worth worrying about.
>
>And hey, just to really hit this same argument home: I can absolutely
>guarantee that you have a much more insidious problem of "wrong hash",
>namely the "oh, it's actually a valid commit hash, but the Fixes: line
>simply got the wrong commit:".
>
>Because that's a mistake I see regularly: somebody simply blames the
>wrong commit. I've most definitely done that very thing myself.
>Sometimes it's people reading the history wrong, and not realizing
>that the bug actually happened before the blamed change too. Or the
>bug ends up being a combination of factors, and people didn't realize
>that the commit they blamed was just one part of it.
>
>So my complaint really ends up being that anybody who trusts those
>hashes mindlessly is going to have mistakes, and the actual hash
>collision case MUST NOT be the primary worry.
>
>Because as long as that hash size is all you care about, you're
>barking up the wrong tree.
>
>               Linus

-- 
Thanks,
Sasha
