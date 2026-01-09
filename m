Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B035CB7A;
	Fri,  9 Jan 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972504; cv=none; b=DQ9066frSSxRl2UeMnii4IquO1ffGlXag46pBI6eh1DXIevnx7qFvHN7f1X1VoUtP6hRsOesuzt8kw3hZz1Z5o65IZcUXXPcG5MqRHw8SizcYI9+sJUV035w2RZmt7jDSc8ugJ01YYmSOU3D/ecqTDDRiU7dYMHHGsRshB7ZZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972504; c=relaxed/simple;
	bh=NhRvRCp0c1F9WwM/zfvadOf4Rq4rIt5sZUyaRX+DEEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldp9lEQxlFa6EP851zKSX71qI4W40c/h3QlRkJIpfxQWoHx1IYDVVZeDU0Nz+PywdfXAaYvDsWUOx5WlCgQT+CqVT3vrAy++6Eph9kdYYEczveWLcDsKbGdTle3Q+vWyr0ECfH2QjfjjhBN0SQDwSecalVLspkAyeGklC6NNWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 2AA6D1A01EC;
	Fri,  9 Jan 2026 15:28:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id D23CE2000D;
	Fri,  9 Jan 2026 15:28:15 +0000 (UTC)
Date: Fri, 9 Jan 2026 10:28:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Dave Hansen <dave@sr71.net>,
 Dave Hansen <dave.hansen@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260109102846.3feeb36a@gandalf.local.home>
In-Reply-To: <de260c56-d3dd-449c-b5af-4d85b268f90c@lucifer.local>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
	<a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
	<20260108151437.3188cd53@gandalf.local.home>
	<aWCVYLuUFZrsbfd-@stanley.mountain>
	<de260c56-d3dd-449c-b5af-4d85b268f90c@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 46gz7xkkg1zmgf5t9enfk35xuejcxwzn
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D23CE2000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19h4ZH4IiaKWHQMfkWAz6blJQb4DXKUOZQ=
X-HE-Tag: 1767972495-981273
X-HE-Meta: U2FsdGVkX1+UakuU9encfzQz+YKgPjAfl7oAp+YCqUrCTLCRKctTXNsr0V7EoAV1Al67vbqA5nj8wyKomSjtXgdkFy2vTr7953cOIspeKCQiVqBxYWb4zDGdkFU+fBUw2FYrI7fS4i53aM3A3nJizriJJMU+8ecZdIbE6loi84Pi3c7h2XNhgUIbQxaRjisv7FBV8349A44teuQBepAO/N9Oei4c4IZ16XyHu6qJdusJpuAeIk/qs376KcbQKlZUAio/N25q+yLCCsgdQuvJHyeH+7GozSKyvMr610A8B2utKEQS2i5awFldTyRktd9GgpzgtrDx3VvzmE7R/DH5+R8lRHxwNtj6

On Fri, 9 Jan 2026 07:28:01 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > It's better to have a grumpy document, instead of grumpy emails.  We
> > need it to sound grumpy and it needs to be the first paragraph.

I disagree. Specifically because of what Linus had said  (see below).

> >
> > AI Slop:  AI can generate a ton of patches automatically which creates a
> > burden on the upstream maintainers.  The maintainers need to review
> > every line of every patch and they expect the submitters to demonstrate
> > that even the generated code was verified to be accurate.  If you are
> > unsure of whether a patch is appropriate then do not send it.  NO AI
> > SLOP!
> >
> > Of course, sensible people don't need to be told this stuff, but there
> > are well intentioned people who need it explained.
> >
> > regards,
> > dan carpenter
> >  
> 
> Exactly.
> 
> Every version of watering it down just makes it meaningless noise. The point is
> to emphasise this.

The thing is, the AI slop sending culprits are not going to be the ones to
read this. It's the people who want to do the right thing that this
document is focused on and that's why I think it should be more welcoming.

That said, I just started looking at your other email and that does look
better. I'll reply there.

-- Steve
