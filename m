Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB80033ADB8;
	Fri,  9 Jan 2026 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974857; cv=none; b=BBtHYTUzjcMK4VDZwi2rqa9X4qoTAfx88H8ZgWi2Z7eipfOB8UUgdBFyk+CSXJwo+mb3ib9inXYM51dURT2hNt/q+p21/+FONkU0265F21qT1jlTWaeG80IvgJrhd/2OMCLsQKHGSFrPH4xGq5/jTLjyaS59abONBUuxAfBp6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974857; c=relaxed/simple;
	bh=pfnpiyHn27em+rvVc3b8E6XRaOyJ2DfcaVt+Ni9AwTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+InJC/I70gZdW8Wy4eALpWwOw+kTZ1MGTpDWaSrCJ+2CcQjVa5jkjJVTwz5luG/oYDpGvAPPIH/vMej/qwOFbeCPa1IJfZGb8CiQ4KEtxqCSWf3DQNPNBr+fOTpT1nzqNDM7VPqxE0DslLmjglu9UBmFWr00CVT5aadA3Z8o/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id EA89E1AB13C;
	Fri,  9 Jan 2026 16:07:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 259BA8000E;
	Fri,  9 Jan 2026 16:07:28 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:07:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter
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
Message-ID: <20260109110759.036473ba@gandalf.local.home>
In-Reply-To: <4a8256ae-04b4-4b4e-b638-5e4cbc2362c5@lucifer.local>
References: <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
	<3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
	<aWCSVh6NocePMvp8@stanley.mountain>
	<0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
	<20260109085446.GA9782@pendragon.ideasonboard.com>
	<20260109105104.57d308f7@gandalf.local.home>
	<4a8256ae-04b4-4b4e-b638-5e4cbc2362c5@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 259BA8000E
X-Stat-Signature: xqdfc3n36b4aoqgahukggf3oaozeu1yi
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18X6Ot+mhU3NXqMBgmI7jIM34Ha4me4H8U=
X-HE-Tag: 1767974848-41460
X-HE-Meta: U2FsdGVkX1/JcW6TqJePIxeAukzcrfKshoQimfd72E2HfI5ryg7SKB7i3S3UIDzocszh99uZzc89IGoa4KBdgbWLMnfLfMvQswIChgIobPDLLdZn2O75ZxVmYURtyOtlejwWa5z+tMsAKgs8hLGikI6MFQH3DG2vv0lUH00BvLhcuiheZBA4lUVYUKvVA/r4GFBBlfzCnoig6VC8eA/IKU/DQtih7bbExRaLT1jP2okFR+3b22WQFDwVXjA37sV8QCIYEvc69MWfSB0A3NLX+cyz8+ZAnGWFUt6SMMBJvOshh97dubkJMV1gQ7PV2B212q1L4eWloXzjw5zS4GyCur0ChB0T6FJo

On Fri, 9 Jan 2026 15:55:01 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Sure to the above, but it seems (...?) you are ok with my addition to the
> document which hopefully is tempered enough to provide the emphasis I'm
> looking for (note I say - all tools - even if LLMs are the most obvious
> exmaple) - without being so strident as to seem out of scope?

Yes I liked the last example. As I stated, this discussion helped me
understand the issues I had with what you wanted to add. I wanted this
document to be just as applicable to checkpatch and sed scripts as it is to
LLMs. My fear was it was becoming too focused on AI where those that are
submitting checkpatch and coccinelle scripts will think this doesn't apply
to them.

-- Steve

