Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E7F33C188;
	Sat, 10 Jan 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768061242; cv=none; b=g8Js+kU0MY21aM2AZq2atauSmgQfIbAOyYLnSXTLie9/Cj5/Qg2IP3rdOgcs4IILBfC1Mixp4wmamAmCkedG1MSmPrVQwFIpqrCtyYjG98/9jgZXzd3SDu02ln5kM+FMJPdjSbC2jQMwcFGqowlN4d4rdSbZVeuyXuT3jjzaNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768061242; c=relaxed/simple;
	bh=gi1YWfNU+kIZij9E5Bmx90OlezzJtQ52D13+z96IONc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBm+iSggpaJTA8i2jR8Dfg69hZnLN3Ftn1XrZFfvRI6RA6H+Zw4+aPSKN/4e5gWiTP7cjeXktanMHc0Gw2YPX3vtBUU6qefPz2gQIX9pe0eGIyWXwwrnBBAuysUqYZQL7srrIqZzkx1nWo4d7zTPTjsLnBf4V4MBPyYOSXIEJlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 30301B79D4;
	Sat, 10 Jan 2026 16:07:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 528B160010;
	Sat, 10 Jan 2026 16:07:12 +0000 (UTC)
Date: Sat, 10 Jan 2026 11:07:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Wilcox <willy@infradead.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>, Dave Hansen
 <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>, Dave Hansen
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
Message-ID: <20260110110710.7f91bdd4@fedora>
In-Reply-To: <39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>
References: <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
	<3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
	<aWCSVh6NocePMvp8@stanley.mountain>
	<0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
	<aWJvcPeV5ziCt5Du@mail.hallyn.com>
	<aWJ1ufun16-5EEkb@casper.infradead.org>
	<39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 528B160010
X-Stat-Signature: q9xbgbmqajmd6sp18zie86nfnd886yrq
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+aNXtAih8pU7virKfxoFPXi5+GN6syIeg=
X-HE-Tag: 1768061232-652617
X-HE-Meta: U2FsdGVkX18X6AOwOH2mzFb+HjXsHuayqeGaBRHpN0xf022qIDb7CYzhsYiK14quvuRYVw1iLQ698D4UQOOE9/uqULiRiJ3i1YjEKqyZ8DH+YmJyYqXrZuTQ5I9fuAZRP2z/jPjZ1rb4cjtdXSd5KeY66k8PPoo69hg3UCdatzRl33ev946hP/tEJpqZR7fh4rUHYRU03PwsoQ9BjfPPXijy3RF7F+0TcblhSpc5W2Qu4c7VzEwoisPQIlH0JngqDika5i8zsJOTDStd+O8GJOKErt7tQ6N2Se9FyPaoMPJXTowBpdwW2/dC0KwVQjs58Gr3Y07/ZwsWVXoblVEqRphlgfvKapSP/Ov7OSfJFhCRKosjnihRwJFPqG1HZXKnpmvNydBYPw1VL/aTfCIsPQ==

On Sat, 10 Jan 2026 11:02:19 -0500
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Sat, 2026-01-10 at 15:52 +0000, Matthew Wilcox wrote:
> > On Sat, Jan 10, 2026 at 09:25:36AM -0600, Serge E. Hallyn wrote:  
> > > I just don't think the word "slop" should be used, because while it
> > > may be very clear to you, and may be clearly defined in some
> > > communities, me, I'm just guessing what you mean by it.  
> > 
> > https://www.merriam-webster.com/wordplay/word-of-the-year  
> 
> Just because it's the word of the year this year doesn't mean people
> will remember what it means even after a few years.  "Rawdog" was the
> OED word of the year in 2024 ... that's losing its resonance and who of
> the under 30 crowd knows what the 2000 word of the year "chad" means? 
> The point of the formulation I proposed (without mentioning slop) was
> to be generic and retain its meaning over time.

I agree with James here. "Slop" may be well known today, but it is
still a slang word. It may easily lose its meaning in the future, and I
don't think "slang" words should be used in the document.

-- Steve
