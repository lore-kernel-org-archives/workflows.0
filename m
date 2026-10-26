Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044446;
	b=EY+LbZCNNfR8U81lfCh2mQEQeuY3KGcBa+j+nB0ZEPSLJjQ0WknkCYbkzKDmvel+lrBb
	 6IFWZ1m/NbqmdARZYNV2S6GvaknJF+kwbHchdi+bgSqq1Dj0THuc1g74AdcwfhTI1tVlF
	 Xzs63dmB8O8afBUpBrv5pWQZsRU4+AzHSvcB2S0RSQNqVf+sRaF7TusqUn4Qp6u/lQ3Ib
	 WpcQzyo1sPxczb04N4wxdlWfBZcUACIGxmFkvv9M3VPWvA3R/VHa37NjXuQ9s8on8VZWi
	 gwtoGWcWKWK0+RMOqTxxalebAFiDq7R/jMyrgbLiEM2oeIEzMppk/OnDdV1qGRNvEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044446;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=t2WP/1MRq2fCK/I0ZlIcVsv6v5NGgJ3Jv9z6l/Veweg=;
	b=JU1q2quUBYsdPjU0XA+H2NbsyCtjT5QDkmYiRuKobg3vOg1qfYwTaLwF2Eo6rKzw6lji
	 XttFpSHGxt4qE3dgA3kbX6y6UMFH015/Xz2xgT/FKiem1i7TbD1XvyDjBXbFW48g1qjoy
	 Xk0L/5af/hDAp7onze/UWbePhoIw/9RfnGbSMWWjdZcAUq0sL8f9t7Cokx/nE/2URDXJp
	 qITUCxJWM2E0BljXt6a4/eqvP4POnzEvXtn0zY+7dlYyhs3sQ4Q9LZdAzmpWwi0Z2gcQW
	 9G1yhOyN2Zi5KR9iA+v4dqE7SOF3bt4LXsxUbFDQqQGI+NaH9pAdfQ93hM/iExqZYYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=GCQcX2k2;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF4606A31F
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 19:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACF4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=GCQcX2k2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1793044438;
 bh=t2WP/1MRq2fCK/I0ZlIcVsv6v5NGgJ3Jv9z6l/Veweg=;
 b=GCQcX2k2wIjNENiv691IocJ2Ew2hQ45wVb01C+IKHk8nWmq3nnZqYqfHQbbgEX92xmcRUyNtC
 9MQzVfwfu/iwUL3qjj2FviGgQq3OABu6oTxDM+3fAB1dak2f3ZpnAm/nlOYBY3hu33MsmfhmeNd
 2kevWLtVtCOTPcmNZH72GWI+65XGuseWF2HGKFf1xOh1pJou9+GRgM6DNNNz1YfCNT3KT005d2S
 u5vTG7jKF5scFu/v6QM9g49iaIbG9ZqMHSv88eO2QVcTaSC/gvT4PLke1/kGW0N3wB/aFSH6zr0
 Rr1tOPr9M2Hz7k7EocG7rmUqfPQcB2Xsr9f6yPrtW/Aw==
X-Forward-Email-ID: 6adfafcfd8313e3592e45e13
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.18.11
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 26 Oct 2026 15:53:48 -0400
Message-Id: <DMF17B2ZLUVC.3FQPOG5TPIX@ubuntu.com>
Cc: "Troy Benjegerdes" <hozer@hozed.org>, "Theodore Tso" <tytso@mit.edu>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
 <federico.vaga@vaga.pv.it>, <apw@canonical.com>, <joe@perches.com>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Justin Stitt" <justinstitt@google.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Jori Koolstra" <jkoolstra@xs4all.nl>, "Brian Foster" <bfoster@redhat.com>,
 "Christoph Hellwig" <hch@infradead.org>, "David Disseldorp"
 <ddiss@suse.de>, "Mark Brown" <broonie@kernel.org>, "Jani Nikula"
 <jani.nikula@intel.com>, "Jens Axboe" <axboe@kernel.dk>, "David Hildenbrand
 (Arm)" <david@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, <lyude@redhat.com>
X-Mailer: aerc 0.21.0
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false>
 <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
 <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>

On Mon Oct 26, 2026 at 3:39 PM EDT, Linus Torvalds wrote:
> On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
>>
>> On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
>> >
>> > It *is* possible to make a deterministic LLM, and this is why I think
>> > it
>> > is critical to my personal future to have an LLM that can actually be
>> > understood by a human instead of a random number generator casino
>> > that
>> > sometimes puts "4" in your private key.
>>
>> I hate to break it to you but that is literally not how large language
>> models work.
>
> More importantly than that - the whole "deterministic" part is a total
> red herring.
>
> We shouldn't even reply to that idiotic argument.
>
It's not idiotic. Would it be considered non-deterministic for a human
to intentionally add a line of code causing a kernel panic for no
reason at all? Or an LLM telling me to jump off a bridge?

When it comes to human development, people *know* what they are putting
in. An LLM does not think about the words it is spitting out.
> Why? Nobody is arguing that we should stop take human patches because
> "they aren't deterministic".
>

Except humans want to actually contribute to the kernel, not make their
slavemaster happy.

> So anybody who thinks we shouldn't use LLM as tools because of that
> reason is just being dishonest. It's just a disguise for "I don't like
> AI". It's not an argument, it's a complete strawman.
>
> We have had non-deterministic tools in the past. One trivial example
> of that is just different compiler versions that have slightly
> different instruction weights or just different rules. Even when they
> are individually deterministic the end result is effectively that
> different people will get different results.
>
> And not all tools have even been individually deterministic - actual
> real non-deterministic behavior exists in non-LLM tools either becasue
> they have timing issues or are explicitly using random numbers as a
> way to get their results: Monte Carlo simulations is a very real
> thing.
>
> And yes, non-determinism adds a wrinkle to things and it's something
> that needs to be taken into account (and people often add things like
> explicit seeds to avoid it when they need explicit determinism from
> otherwise non-deterministic algorithms). So non-determinism is
> something that should be weighed as a factor against what else the
> tools brings you.
>
> But it's not actually an argument against LLM's.
>
>               Linus

Well said. But also, we won't be able to "submit bug reports to LLMs"
like for years people have submitted bug reports to compilers.

-Josh
