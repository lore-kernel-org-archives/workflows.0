Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575F22ACEF
	for <workflows@vger.kernel.org>; Sat, 15 Nov 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249432; cv=none; b=uffB6H2adFKKJE+Wgpc/mYozkmggONQBOUmnAdeHPCRA33cBQzjAz48VlrfBAETuC0EcBIKTMSnX6d6Bnw84S2ePZhM0lO0hhDk6Mk8EIVj3VZYprp13PZojKwkQXj1u9ogIPCWAomLDeQBA6ZJiYvLOnBGMJz+sNQRbNwSfI1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249432; c=relaxed/simple;
	bh=aeaSB8wDx6Plj35K6ZGC2e2tnQNdri4T9y8baRoHtKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TCtETLw6thlMIbJms95is3xs9N7JkVXgtwC7JJQ49IueczK6MQdjJqHuxLfn8ZH5FnVev7Qi3aj2QcbX1vU99EyubSVoAxG+dXa+BhzVbB8DQQQhOaS2oi2glkvmfx2S9gGmxYARCpFAXWyn+YmUtjnIVSlwFz2XWEaLvKSML9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oIJrzGvY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tYkJcOFl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oIJrzGvY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tYkJcOFl"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763249428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bq4muiyIALgF02RyQ5JTyueNWXz7U4Aq8MTd9a86kx8=;
	b=oIJrzGvY8iKZpQB49Epj39H++mPjlidJA17oFwCXeYScw6Mm4AOUw0qTfRQXydXlnZ0KUa
	KveQzXojoN4sahCD9oDUYByCj39Z/vjWuJyawOUQkIENkK+Jo3rgUvdjTH+Q3jLDndHvVO
	LcQzEJz4d4uSy8cqZ0Imt8sQJG5rVilxEQMaaRxhD/VMK2cRj5haXsc1drlfXJrFypUc5q
	bVyRaJC1ob//gmrK78fEYAmN1pZ/JvZS5qgt/ukChOMbOaQWPIgCr7yq/p1bWGIJ4uOALw
	pwJtrT+DglBIICmXjZ51Bq5+P/a8iDjv9153OFvzDVNyjUvLe25ziqMthXp4rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763249428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bq4muiyIALgF02RyQ5JTyueNWXz7U4Aq8MTd9a86kx8=;
	b=tYkJcOFlHMCIOovC1bB/S4ZAbo9C0ht+rvLexru5uxwowCVxHsl968YeqUlxEEUGeji44e
	Mx3wP1IogUxKMgCw==
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <20251115140746.6a3acfd5@batman.local.home>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <87qztz9v88.ffs@tglx> <20251115140556.44aac254@batman.local.home>
 <20251115140746.6a3acfd5@batman.local.home>
Date: Sun, 16 Nov 2025 00:30:27 +0100
Message-ID: <877bvqan70.ffs@tglx>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Nov 15 2025 at 14:07, Steven Rostedt wrote:
> On Sat, 15 Nov 2025 14:05:56 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> As Dave responded to Luis, although that is a good idea, it's out of
>> scope for this document (for now).
>
> I should have said it's out of scope for this patch, not document. The
> point is that what tag to use for this is a separate discussion.

Which should be held in the context of this patch to make it complete.

Thanks,

        tglx
