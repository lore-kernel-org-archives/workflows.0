Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345F500942;
	Thu,  8 Jan 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883767; cv=none; b=IOsG3NGEMxfqX4+ys3wP6FFuHRP/PewPC7JOK+1X07DL1oP9R1wBoyYYKWbJz8eSrX/Z+D5N6IjTIkth+fRnFcbhf3Z05Sb0fAob2id2EnSGkTogPKKk/FdKMbLXMryD/hdjCZ55++2ySl8+ySTln2CUQvGXHhLEfKFIAVyt934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883767; c=relaxed/simple;
	bh=STgSsIB23dKPIa98YsLv4Dw6Ve+Siz95Dle1zSVbB8A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U1mKDewEsLZsTWPaGK0ixI1qfqWbyvaqZjuJAtigJ7X+Irvq1/I6nV64YhW+5ZYDGKdsmeedgJYBA6KXERDyQj1iWdWhS+d86TGJxHxhAzGD0LIXrMbe1cEmbYb+60U7DCCSPi4XJrkZH/45lG5Ep+Tu+E464FMyJwe9on9fQB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=vBtlYdfr; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="vBtlYdfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fdrLd79Mo5p2aC5Oxr+75v/OGdzxyTp4flifQOZAG8c=;
  b=vBtlYdfrrEf5N9RYR3fJtrtr3BadS9raVMBxgzoXZ/J/V12hsbG+TO8h
   5TyJr3rQLAr/HrO286skGMEhWaaqDSmSAcTxUnAyYwUJyIPIUC4iaHEXC
   IijtFm/O8V+XKeufUukC5SoEPyDDR+l/sxHxKCd+dkpTY78XQGbvg31F+
   g=;
X-CSE-ConnectionGUID: 8tiNBkNQT8+Og8ZOC97Hmw==
X-CSE-MsgGUID: E7hLJLoERCutdnsZDb3UkA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,211,1763420400"; 
   d="scan'208";a="257640710"
Received: from wifi-eduroam-84-204.paris.inria.fr ([128.93.84.204])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 15:48:15 +0100
Date: Thu, 8 Jan 2026 15:48:14 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>, 
    Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
    Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
    SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
    Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>, 
    Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, 
    workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
In-Reply-To: <20260108085215-mutt-send-email-mst@kernel.org>
Message-ID: <6041b4b8-303a-f12b-24ea-92b836b7a025@inria.fr>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com> <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net> <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local> <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com> <20260108085215-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 8 Jan 2026, Michael S. Tsirkin wrote:

> On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > > +you are expected to understand and to be able to defend everything
> > > you
> > > +submit. If you are unable to do so, maintainers may choose to reject
> > > your
> > > +series outright.
> >
> > And I thing the addition would apply to any tool used to generate a
> > patch set whether AI or not.
>
> Exactly. I saw my share of "fix checkpatch warning" slop. This is no
> different.

I guess that most maintainers can easily recognize a patch that was
motivated by checkpatch, Coccinelle, smatch etc.  Then the review can be
informed by previous experience with the tool.  Will the same be the case
for AI?  Or does it not matter?

julia
