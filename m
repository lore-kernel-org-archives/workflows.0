Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D65137932
	for <workflows@vger.kernel.org>; Sat, 15 Nov 2025 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233569; cv=none; b=gF7ZdcPIVNCDZthWYMlr0rrYop/+qm0Engz1YA7KZhL0UJxwPp2YilK8pX3bFosvyaQeS3JYuz3XcT0sMNEwEfcRjuBsEF9Rqb/4LwUtQ1R/cDmZwtIsQlSVETb393ebSJKryDCmJT8+GeHNzHLqL8kktJGoFuoTSCtPOClVts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233569; c=relaxed/simple;
	bh=MP1mkKvUeFAek+Kn2iVDLjzz5rgSGjzpOJV48vnohJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fdn5dAx8lCwRusOfqnIBHqAI2ZvuvX5bm/JEE9FZ5lw+ehtbxvtyBqTtC9BH0TesjB+iEDvXJmGElj8KXOZpBA55vQVPwBlntg+iN2uPqa1wjjGrQygAVHpmk5MGSFsdOJdTmuMqwCd31eo8IuLrhJPnvX3OO2NRKXMy+7IZWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 709271A07EB;
	Sat, 15 Nov 2025 19:05:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id EAC762E;
	Sat, 15 Nov 2025 19:05:52 +0000 (UTC)
Date: Sat, 15 Nov 2025 14:05:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251115140556.44aac254@batman.local.home>
In-Reply-To: <87qztz9v88.ffs@tglx>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<87qztz9v88.ffs@tglx>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 6kko9sokqyia8rrcwfzefzaicr4kgzs9
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: EAC762E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19ywqcy6tExYjj/r2q1knvgesmDXb0qbAQ=
X-HE-Tag: 1763233552-937643
X-HE-Meta: U2FsdGVkX18slMpgPCKKJwMClphLMY6Tw4Rm7n20oU0DLDudD//3TGFaPijyCO3xDZJF5Xj2LBVbd3voNUh2mC4eB2bQK+e4KxqUyB+1kqBMHA9k0onZtgbnHos9rbNrkDGzty7/G/NJdvD1NQDtNS6gZLU3UyHHez+n1Lxkl1H7h7zeac5RfpxJa7vTVdkmR/2ottHbNdlXRDDAKVJp/RHFEEeKUiQZcrKc5K2BgIgWWK4cqLR105Hsr78DYbVG9TMJUQwb41u6pOMi4IOajf7kkB2JReYTAldHJWb9258bwzYZ7YN9BPklo5faktMQ

On Sat, 15 Nov 2025 16:22:15 +0100
Thomas Gleixner <tglx@linutronix.de> wrote:

> > +If in doubt, choose transparency and assume these guidelines apply to
> > +your contribution.  
> 
> Can we pretty please define a tag and format for this?
> 
> I'm not really interested in the creative ways which will otherwise make
> change logs even more incomprehensible.

As Dave responded to Luis, although that is a good idea, it's out of
scope for this document (for now). A patch that adds a tag to
submitting-patches can then update this document to mention it. But
until submitting-patches specifies what tag to use, we didn't want to
mention it in this document.

-- Steve
