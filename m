Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033631062D;
	Fri,  9 Jan 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973842; cv=none; b=T1vAMQ/Q4ooVfCVl8Spi9+fPhpnBz2Btx16O9+6E1fZ09ySm0GKOmpXNfv3Fulk1ctq8NkYLNR6Gd9CZ97I6S8pdYnmSceJ427KI+HPE0Bb1xqCoOjvmwTzq9+k1SSH1bppzkofqa7GzQHNu6c6HriTrjIJDAv3QpTxNy2aHqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973842; c=relaxed/simple;
	bh=vRBYVTy8IthCQxIYOY8ZHNIWfs17eqgsyxUXnG9lOdg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrmbefHqofq1mOcIbKQVGUVEz7CYTXQwvd7kuCO3mobTT62rgG0Wv7jJyWrH9Va2dP7DMTDmVTHwC6FKb31UMGjQpqNYh1RJ67+St6Y7EKXZngUICONrTSqneCvsWLAJ0aKklb3axMVhvSn1WHe2E74lkd3amLLEza5gybv7pxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id F29E71A0295;
	Fri,  9 Jan 2026 15:50:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 1E3B52002A;
	Fri,  9 Jan 2026 15:50:33 +0000 (UTC)
Date: Fri, 9 Jan 2026 10:51:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>, James
 Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen
 <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel
 Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae
 Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, NeilBrown
 <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
 <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260109105104.57d308f7@gandalf.local.home>
In-Reply-To: <20260109085446.GA9782@pendragon.ideasonboard.com>
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
	<3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
	<aWCSVh6NocePMvp8@stanley.mountain>
	<0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
	<20260109085446.GA9782@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: r5f5spci3tcrdcaw6myfh9wuoye56ibt
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 1E3B52002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/bnYXkaytMCEQZOEnH/SPYaEpkf8Fk+tM=
X-HE-Tag: 1767973833-864549
X-HE-Meta: U2FsdGVkX18EYUSC5vjk8jtI/6+rQW6IXaqdPMLwNlW3U0qbjrCHkIMrRpZ81VygNdhTFEI0Pi8HenC+K1Z3Syuz4p4nM71pNQibwmDdhwtPV65o//WLbcePvUInt3DQxzj3tq1+DmpaHVRssdDqHb6ICNWjUrIpCmyCVR9yKDhPtOKEajVoAl7X4K+BAWXR1JXQfoOULNhEri6gBLjv5yZoEFF0htqWKCX0dkTrB9eeRlG8tLaJfsiGv4nWotLZMoqey3AFUnX+d3UZvASWVtxoE7SMPKcL3aA/pHXnTat2RJhKqjIT34ucFsRY2GQAj4NGSgAsipJRrgeX0RHipZwcRiUu6y3PtLK7tspZ7kMyw3lOaDV1UsbmUk+7nmKJ

On Fri, 9 Jan 2026 10:54:46 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > Which is why I'm tiring myself out with this thread when I have a lot of other
> > things to do :)  
> 
> Thank you for that. As a lurker in this mail thread, I really appreciate
> your efforts as they're saving the time I would need to argue as
> strongly as you do :-)

And even though I'm arguing with Lorenzo, I appreciate him giving his
feedback. I'm not at all frustrated with him, and his arguments help me
understand my own ideas about this document.

> 
> While I agree with the argument that kernel documentation should not
> cover every single hypothetical case that one could come up with, the
> issue at hand here is real (based on the multiple people who have
> replied saying they have seen it happen), and I don't think anyone
> expects the problem to disappear magically given the industry trend.
> 
> It is also absolutely true that actors with questionable ethics will not
> care about the documentation. I do see value in being able to point
> developers acting in good faith to the rules, but an even more important
> point in my opinion is the message your proposal gives to maintainers.

I'm actually not against a document that is all about AI slop. I'm just
against hijacking this document into being that. This wasn't the purpose of
this document. In the TAB, where we started discussing this (and I was
supposed to be the one that wrote the first version, but thankfully Dave
did a great job at getting it going). The focus was to be to document what
we currently do in practice when it comes to tool-generated content. Notice
that the subject of this document doesn't even mention AI.

I personally (and I hope others do too) want to keep this document focused
on transparency when it comes to tool-generated content which also includes
testing and such.

Now, in the future there may be a need for a harsher document to cover AI
slop. I just don't want it to be this document.

I don't think AI is just another tool, but in this document it is, as the
focus was to talk about all tooling that generates patches (which is
everything from sed scripts to AI). I don't want this document to be
focused on AI at all.

If you want something to point to when you receive AI slop, create a
separate document that is for that purpose only. It will keep this document
clearer and also be more useful to the one that needs to read the AI slop
document, as it will be explicitly for them.

-- Steve
