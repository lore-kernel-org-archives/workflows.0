Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930F43933F
	for <workflows@vger.kernel.org>; Tue,  4 Aug 2026 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841837; cv=none; b=ArnZRWaZi8CZr+VXGGLhgtyjPteQ1+ETVHfM5ZpV1DnDOsa8NmslGDHL9i7GywlPB4AXfvFYBBUMqPdklE0ieBa3prvPl9EvxtIclPLGeyjlObCvm8VuYx8ZOVNuexJbnjUs33qEAqI0wrT+CiR9cV8OEVgAwM69qzzqrrz7cHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841837; c=relaxed/simple;
	bh=T+HDRu4niA/NkDzRpO0kqslAON6kCOrOWYOXK02mWHY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=rOIEk5GNKnlj+dNiHC3c9XTDz9vyBiAxq9A2YrYjDQkkqlj3JeMRsRup7C7IdmqfOVrVt10d8j6NUeQNtezXtt+AwgY4tt8fTAzkGtuuCcVRIJs8wP3H5z+aT2mhJDVGtyuErPQ121rDJhRXn+NhJtb9HLz3Gck3S2E87ZrGPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=JGRoqPRR; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="JGRoqPRR"
X-KPN-MessageId: f3075d17-8ff4-11f1-9e8e-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f3075d17-8ff4-11f1-9e8e-005056999439;
	Tue, 04 Aug 2026 13:09:23 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id f2fe81f7-8ff4-11f1-ae90-0050569981f5;
	Tue, 04 Aug 2026 13:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=ijg7g8TPWjt69DekBH+l3Uy8di0OTCHb9W1RN/fHjMY=;
	b=JGRoqPRRKbt56TAXm2pH1X2tdfcd61OC7jNnMcA/6D2x6duYL/g2/FW98Q+3R/KHUzYSKGhEFGyLN
	 ncya1zv5Pt3B4UxXu/GsSv9HjE+vKyxEAxPq9jVmwC1rtu7o6cACCUIugNYAbU4xr0LAUTPqEEttPG
	 hQ+Ws7OCYuRJuGoqshfwcSwBfBFyAcS+j6yVhsQQjiRuBest5eoIAeRlfJinxXYepvCS4ku5GwQluG
	 RpuJBi2yYBZUq2JQBh73BTAY70l/iJJ7niveXUrBfphBcwr5CQtoIK+a1BQWfAiFYY9UzXDr9pIkTE
	 PPtZF0kEIMFeLvTOwqlAzXm3vHWB9FA==
X-KPN-MID: 33|eVGOSMrpwBZsmRzpr95EduQZLyxagJ2qdTOTsIt57ob468BoanlzxtfvWQSEemq
 6x9ZAwY91r+ZPnOmHkLsC3npHjm1E6SeEDw3M3yMQR14=
X-CMASSUN: 33|32pYAWqXlp+03HWpurBpSiJKHDbmS+/bNjfac4jrSlTWnFNH3ADvVdi7yJoPveD
 y0KGR+jw5IEvS2FYAbADyKw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh02 (cpxoxapps-mh02.personalcloud.so.kpn.org [10.128.135.208])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id f2ef5c42-8ff4-11f1-8edb-00505699eff2;
	Tue, 04 Aug 2026 13:09:23 +0200 (CEST)
Date: Tue, 4 Aug 2026 13:09:23 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Konstantin Ryabitsev <mricon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Sasha Levin <sashal@kernel.org>,
	tech-board@groups.linuxfoundation.org,
	Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Message-ID: <1135422962.153066.1785841763574@kpc.webmail.kpnmail.nl>
In-Reply-To: <anGCdTMRCA09cDKV@lucifer>
References: <87qzkuahlr.fsf@trenco.lwn.net>
 <20260722-accurate-defiant-puma-a7e23b@meerkat> <anGCdTMRCA09cDKV@lucifer>
Subject: Re: [PATCH] coding-assistants: simplify attribution
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 04-08-2026 10:10 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> 
>  
> On Wed, Jul 22, 2026 at 04:48:03PM -0400, Konstantin Ryabitsev wrote:
> > On Wed, Jul 22, 2026 at 02:34:40PM -0600, Jonathan Corbet wrote:
> > > -  Assisted-by: Claude:claude-3-opus coccinelle sparse
> > > +  Assisted-by: LLM coccinelle sparse
> >
> > I've been playing with this a bit, and it's pretty easy to teach the agent to
> > add a few tag-like notes as to how exactly it was used, e.g.:
> >
> >     https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=018b87444d32eb2ffee7cb25f0785e54aa35f7bf
> >
> > This has:
> >
> > | Assisted-by: LLM [design, codegen, tests]
> >
> > It tells us a bit more about *how* the LLM was used, without introducing the
> > advertisement or pinning exact models.
> >
> > This format should allow for multiple tool usage:
> >
> > | Assisted-by: LLM [triage, tests], coccinelle
> >
> > I don't suggest this is included in this version, but it *is* fairly
> > straightforward to add to AGENTS.md and tells reviewers just how exactly the
> > LLM was used.
> 
> I think perhaps this should be a follow-up (this stuff is so fraught that I am
> super-glad to see Christian's suggestion fly through and want to take gains
> iteratively on this :), but completely agree.
> 
> David suggested something like:
> 
> Assisted-by: LLM # < what it actually did in the patch >
> 

We should have some format to explain what the assistant was used for,
but not sure if a single line after the tag is going to cut it. I agree
it is the most simple, but I have personally used an LLM for a patch where
the explanation of what exactly it was put to do would have been very
hard to fit in a format like this without significant loss of information.

So, maybe below the ---? I guess that most maintainers don't want this kind
of explanation to be part of the commit message (or maybe they do?)

Best,
Jori.
