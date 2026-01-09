Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974C2DECCB;
	Fri,  9 Jan 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985696; cv=none; b=A7AYhxlz+N9Tqmwb3H25byIJR/yYg28oFDmXVIE+Jk/hm5VX9IZXtpGOMeMmWdPc4ui7MbvUL0am+r+pnFqjoRCBbLK+V7yMpGUJsZlFgg0oMqMtvXMF/1FpgrDtsYdWSH76kpO8J8NizMJ9BndcGOcnPoC04ehFi60fdmxeCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985696; c=relaxed/simple;
	bh=Zlt2xaYFDRYmeGe845puoyPls5sQHwv4pqv3rJqOc1o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMdXGJoRkmz3QpQzdjOqv+1lX+EwWGartJkxLviOAtdV7aOP65fpW2N6rgXr6y+DynP/TlLxB6v5JhpKBepIg76T1uARJ63o24xpncxSlUZWGGNwYLhpl7bUrn0nMN7iXwUT8kOSIdSmURGuUanrmRDDc66+cXQhfQy/fDM8fc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 29E16BB493;
	Fri,  9 Jan 2026 19:08:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id BDB0E34;
	Fri,  9 Jan 2026 19:08:07 +0000 (UTC)
Date: Fri, 9 Jan 2026 14:08:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Dave Hansen <dave@sr71.net>, Dave Hansen
 <dave.hansen@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260109140839.4182fa0b@gandalf.local.home>
In-Reply-To: <20260109103435.cb555ad5374a50db413e3861@linux-foundation.org>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
	<a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
	<20260108151437.3188cd53@gandalf.local.home>
	<cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
	<aWDf1zlLTKmw9xnq@stanley.mountain>
	<20260109103435.cb555ad5374a50db413e3861@linux-foundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: BDB0E34
X-Stat-Signature: gjjaa3omo738gzi5n5t54e5d3zp4tjiz
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19fMXmrir82i+19M7/Mfy4Zw85DRUpp1SI=
X-HE-Tag: 1767985687-450843
X-HE-Meta: U2FsdGVkX18pLMF2iTSKhpl8bgQIslyqOlbLs/nnA9OTbBhfHx3cuxx0tjatz9JJNZCgfWgQCwFeJ/S/8IDKB5jRf4+Ee6XRqUhSofUKg6V5IS/HAOGZsTOuVfdUAU7x8nWODQL2XJMc3u7iZYfTkzO1xwivHvkw0ROhQqELybcLkltn7cEymF7je2pI3IczYr/8+8n5QL8Aomoak/Z6w+9GkwrZRBg6yEVa2rfXQDqfSmAohLromYbAw7UYW0/yqgKUeRaPybe0OWbKA89L/kfmkQoHXq6BCFa/JPEBFAY9O9wJVbKHYPvQ/1u2ki9ygrWAsDVSciP2dxlSG8Dt6XSf0unxSDMhPKe5eQv09JnoCe9rBwtXCsjw+Xjegj6h59mBgG97ujYRBo552SbMf4At4v5O5FLMeEZSqGyaiUFQCvp/1BEmQA==

On Fri, 9 Jan 2026 10:34:35 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> As we work through these issues, please let's not accidentally do
> anything which impedes our ability to receive AI-generated bug reports.
> If that means having to deal with poor fixes for those bugs then so be
> it - the benefit of the bug report outweighs the cost of discarding the
> purported fix.

I agree with this statement. I just said that I find AI a much better bug
finder than code creator:

  https://lore.kernel.org/all/20260109111929.2010949e@gandalf.local.home/

-- Steve
