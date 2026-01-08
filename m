Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86331577B;
	Thu,  8 Jan 2026 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903256; cv=none; b=NfUV1La9BWydJuQKEy3rry5VAweWdjUcVklv3WYRgOUIMPIoByQKJeNyUqpfHbVdVCP34EdoZYazrDVyx71lW31pnTvFusBwq/ncn+oOTTmRRblJ73QU78SEL47CyOhkKdPzBPRrwdjS6oVl2Xpln5FKoJ22CjytL+Kpw7PXoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903256; c=relaxed/simple;
	bh=LH386V7FaIqV6aHMZemYH1qApbj72s2v/YsgR21oReg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3QVANAMj/9DieRtel/dCmd/0pA4JaCEB6PUhGusFv5Om5WpY3jhYCU7u9+wL1yv464mj+UqAPx0pQ2mIHQkCabwMKTlMRvsGDJrU5Ks7JJq7+7rIv4aRM+sRNUips3d/axJYWb65nncHbaC2jA8tBxP1N6fFZf5SiBkFKuWRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 041B91602D0;
	Thu,  8 Jan 2026 20:14:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id CEF702000D;
	Thu,  8 Jan 2026 20:14:07 +0000 (UTC)
Date: Thu, 8 Jan 2026 15:14:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Hansen <dave@sr71.net>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dave Hansen
 <dave.hansen@intel.com>, James Bottomley
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
Message-ID: <20260108151437.3188cd53@gandalf.local.home>
In-Reply-To: <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
References: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
	<93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
	<1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
	<6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
	<611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
	<a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: x5irqtk4y8hyijucrnt6tzyik85hdnri
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: CEF702000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ufPkcd+jJv4j+a5wwSNyrjloH17g/cm0=
X-HE-Tag: 1767903247-200859
X-HE-Meta: U2FsdGVkX1+rl+pNmed49qk3jLZ7lXmBtHGwwmYU8J0fxMXNS8cZySDFLFB+hbhZLTDyALM71ttF8/0kscPoLPedfMFfXz7wluGyI55T5tl1eEcO4+wv/NthAuK7AtiqAQzGQ9y+DFi2CUX8XpjNvkkMCrJ4Snl65htSib4VZpVOoH9gL3bKWtCVo6UGbTQpakiP5n8uaoKGm7PTEokGz1sp2zg55OH5VMLO8KiiiG9vRJyodN0fnpYfgkeKAyW9c/4RPUxd4mXuA4XR5gsiq7rT2kb7rQix5C2nfxOYZfmZ//ewTBnmpBCPQ/xTwBIxbUn806u2A4m8X0xE9wwjUuzGxXhEnu1nx788OZVb/I0k5MSGCk5SNmzDUZuKOw4a

On Thu, 8 Jan 2026 11:50:29 -0800
Dave Hansen <dave@sr71.net> wrote:

> On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > I'm also not sure why we're losing the scrutiny part?
> > 
> > Something like:
> > 
> > +If tools permit you to generate series entirely automatically, expect
> > +additional scrutiny.  
> 
> The reason I resisted integrating this is it tries to draw too specific
> a line in the sand. Someone could rightfully read that and say they
> don't expect additional scrutiny because the entire series was not
> automatically generated.
> 
> What I want to say is: the more automation your tool provides, the more
> scrutiny you get. Maybe:
> 
> 	Expect increasing amounts of maintainer scrutiny on
> 	contributions that were increasingly generated by tooling.

Honestly that just sounds "grumpy" to me ;-)

How about something like:

	All tooling is prone to make mistakes that differ from mistakes
	generated by humans. A maintainer may push back harder on
	submissions that were entirely or partially generated by tooling
	and expect the submitter to demonstrate that even the generated
	code was verified to be accurate.

-- Steve
