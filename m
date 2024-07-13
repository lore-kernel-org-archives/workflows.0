Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988548781;
	Sat, 13 Jul 2024 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720856594; cv=none; b=rYdrhkiJR9JnTp0ulgm91YoOUV8Nj9Hvtk67FFx/6i3wNG3EIuwgekWvjJomo/Pc3CirdxYsDATQfPbiYz0fJOmQtJNCD/+s+P5aJrtjKyaPQhdcpHoxYNzcatO6tb8thYd6pc4POhtlaedmlQ13p6srGzi308lWkGBZajXqT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720856594; c=relaxed/simple;
	bh=2uik8qwcSwuaULcD2kRT26Br/TWazbaNt+SmM1E0yBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hsRt+mNKg5WsyemsYEeZEtfZQPfHGEKMuUGlbDM4qasLFZHFobQdJYjRun+u+Whev94ONbqe6ECwC3Xa1Gui6cOg7lDy24UVbZAJcdZEMYv8zPPwwv4a9qiYVa8Vx+aGrmNWb0h+AQjki6KycG2GA7PcV3Nro+ceOQ9wZoU6dSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6s0ul86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6s0ul86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909CAC32781;
	Sat, 13 Jul 2024 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720856594;
	bh=2uik8qwcSwuaULcD2kRT26Br/TWazbaNt+SmM1E0yBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q6s0ul86ROLIVi7jxGNiRgkMaGpC5ZYJczJgwaJWPU4UwNmFtsUTJa1rW4vohoIVX
	 VJkPQlZLJ2MAdJR6FosYnwZkr75pG0Yo8qQgwKTDiahU1ooy3qF3/Hv+DJBOgXKQGA
	 WiB/FbYsDVVZp/oaOgPz9SRj0BFbInZd5zdH6egb8UTiaJarlRRfJSKajDNq/QWiVX
	 WFedGtZklIk36t0gMqX2Z7WUXkEl1jTpyYCUsjLjz3XdEGqonWH/RTNr/caa9wMzDU
	 qOw9+IJXijE2QXvh+ocQa4rdT1fW4MMRrxdYg3PWXhMe4NUHlZog0v2K2cXgMeqGN5
	 GkxK/wfgJspdA==
Date: Sat, 13 Jul 2024 09:43:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713094309.6b203768@foz.lan>
In-Reply-To: <20240712164504.76b15e31@kernel.org>
References: <20240712144903.392284-1-kuba@kernel.org>
	<7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
	<1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
	<20240712201156.1413e80e@foz.lan>
	<20240712164504.76b15e31@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 12 Jul 2024 16:45:04 -0700
Jakub Kicinski <kuba@kernel.org> escreveu:

> On Fri, 12 Jul 2024 20:11:56 +0200 Mauro Carvalho Chehab wrote:
> > Not sure what this somewhat obscure message wants to accomplish.
> > 
> > It is quite common to have developers and maintainers discussing 
> > outside public forums and internally at the companies they're working 
> > for. There are lots of reasonable exceptions besides security. On my
> > years of experience, the reasons I've seen more often are:
> > 
> > 1. language and/or cultural barriers;
> > 2. teaching and mentoring new developers to start contributing upstream;
> > 3. need to have internal discussions in the light of some IP protected
> >    material.
> > 
> > (1) and (2) are very common for non-native English speakers
> > and for newbies, and we do want to have more contributions from
> > them. (3) is unavoidable, as discussions related to protected
> > IP can't be disclosed due to legal reasons.  
> 
> Those are valid points but I don't know how to weave them in without
> losing clarity.
>
> The goal is also to call out such behavior to
> _contributors_, 

Then, placing it under Documentation/maintainer is not the right
place ;-)

> so that they know they can reach out to more senior
> maintainers if it happens to them. We don't know when discussion is
> taken private (by definition). Otherwise contributors get mistreated 
> by some corpo-maintainer and they turn away from Linux :(
> 
> > Also, if you take it to the letter, have discussions on LPC, 
> > summits BoFs, other events handled by the open source community 
> > and wall conversations are "closed forums/private conversations".
> > I've seen a lot of good results produced on such private
> > conversations that solved relevant conflicts and got
> > materialized as great contributions.
> > 
> > There's nothing wrong with that, provided that the outcoming of
> > such internal discussions are reflected publicly as patches,
> > summit minutes, LWN articles, etc.  
> 
> Would it help if we speak of "open forums" instead of mailing list?
> I think LPC including "hallway track" fall squarely under "conducted 
> in a manner typical for the larger subsystem." Here's slightly edited 
> version:

Well, hallway track, invitation-only events and such aren't exactly
"open forums".

> 
>   Open development
>   ----------------

Assuming that this got moved to a contributor's document, as from your
comments the target audience is ocasional community contributors,
see my comments below.

> 
>   Discussions about user reported issues, and development of new code
>   should be conducted in a manner typical for the larger subsystem.

This seems to vague and meaningless to an occasional community
developer.

For instance, how someone that sends a contribution to subsystem X 
knows if the subsystem is a "larger subsystem", so it is "typical"?
What's the "typical" rules?

Btw, larger subsystems usually have their own set of rules. A couple
of them are documented at maintainer-profile.rst, but most don't.

>   It is common for development within a single company to be conducted
>   behind closed doors.

IMO, this is somewhat out of scope. I mean, what a contributor should
expect from this?

I bet a new contributor to a driver made by company X, after reading
this paragraph, would try to submit patches privately to company X
maintainers, which seems to be the opposite from the message you
wanted to give.

>   However, development and discussions initiated
>   by community members must not be redirected from public to closed forums
>   or to private email conversations. Reasonable exceptions to this guidance
>   include discussions about security related issues.

In the light of a contributor focused document, I would be a lot
more direct here, using a text similar to this:

	Please don't send patches or reply privately to discussions
	initiated on public forums, as most maintainers won't appreciate
	such kind of behavior. Private communications outside company's
	own internal discussions are usually tolerated only when there 
	are very good reasons for that, like when talking about
	undisclosed security issues.

> 
> > The only issues I see with such talks is that the work when
> > co-authored should be properly marked as such and that 
> > reviewews/acks taken behind doors don't have the same meaning
> > as an upstream review, as they may be due to some internal 
> > formalities.
> > 
> > IMO, the best would instead to give a positive message. E. g.
> > something like:
> > 
> > 	Maintainers must encourage discussions and reviews to happen
> > 	at public mailing lists, avoiding whenever possible to have
> > 	internal discussions.  
> 
> That's not the message, tho. If someone emails a company privately 
> that's fine. If company has internal processes for its development -
> also fine (as explicitly called out). I'm trying to set the baseline,
> not describe the ideal world.
> 
> I am specifically calling out that if someone submits a patch, or
> reports a regression the correct response is to review it on the list.
> Like a normal person.

It is clear now, but as Dan pointed out, this is the wrong document
for contributors, as Documentation/maintainers are focused on
maintainers ;-)

So, if something has to be added there, it should be to try to
setup a baseline for maintainer's typical behavior.

> Not reply privately that "it's on the company roadmap, just wait" :|
> Or reply with a patch company has "forgotten to upstream"..

I'm afraid that, in the first case, we'll still see this privately,
as companies won't be disclosing publicly what it is on their
roadmaps.

"Forgotten" patches should indeed be sent publicly for review.
The text I added earlier should hopefully cover it.

Perhaps a note about that at the beginning of
Documentation/process/submitting-patches.rst could be more
effective, e. g. something like this:

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 66029999b587..3bdfb820a707 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -16,6 +16,9 @@ for a list of items to check before submitting code.
 For device tree binding patches, read
 Documentation/devicetree/bindings/submitting-patches.rst.
 
+Please notice that Linux patches are meant to be submitted publicly.
+Don't submit patches privately, except for security patches.
+
 This documentation assumes that you're using ``git`` to prepare your patches.
 If you're unfamiliar with ``git``, you would be well-advised to learn how to
 use it, it will make your life as a kernel developer and in general much

> Maybe it's a cultural thing, but to me this is where the relentless
> positivity is counter-productive. I don't want to encourage people
> to be angles. I want them not to do the shitty thing.

Again, you placed the comments at the maintainer's document, where
the scope of of "don't do this" is too limited. I would expect
that people that volunteered themselves to do some maintainership 
are more willing to react to positive messages about the expected
maintainer's behavior.

On a contributor's document, though, I agree with you that a set
of rules like don't do top posting, don't submit patches privately,
and such are more effective.

Thanks,
Mauro
