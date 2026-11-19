Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093276;
	b=0TDE9nx6oalRNE6aKOtFdeqbiTyySeNiyUhfI8WGhBF9FV0ogJ1gcpFXMoBwlxy17Z1y
	 pup1A2dl5KJ2jKfDQaTcygmocY1ue2MErXF0aorfvSwkCoZqx+7H4BXXc3so+PANxqEO3
	 VMJzhPVmGTx9SUBXG8Q0A9zlqXJCl4UpGt5l+pQryFL/V6gjtO7Asj/Uq7Wo31L8x6wjh
	 fUWje153upV3VHBIf36X42YqwcA9Ye4HdiZ0Vj95xqmkGuQ0wNYshhJZcqm43zS5GfZDr
	 G68O72ck+YLGXkN8MJY5XR18G93ChUWE0w0HSOPkkWONIoPq6XQ+0y5Vg5OCoCrevlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093276;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nMMu1SMXpnqRmd5iKVumjMZAYkX/1LCcfu6YZtgDlDE=;
	b=pqc9GQ1luPxR+IlJz61oBkWo7iGJ1wFEo11tGbtUHUXh5Xiz4jSCsM7KKZlvzwIYmMSD
	 ij7A4OMoz4+/hBS5s0Yv1Kt472q4hVY351n2g9wy1rXM+jX1QnuHq3KEMVnOgU4KZvTen
	 ylKY9AGYRMvghwnzOZeOLKLzzv6wxWwB0X/QceXtO/R3vbaZu3ktWjrLOVaxaWtDzAKgt
	 FV2nYkPhTvQn5ZrPf2goqmecoyCumN0B2lXJx4zyjeUj8Asz1+e0TI/uUQi8ul284UJqf
	 Nsb7vy5A6myIolQBvn61WHzS/h+1C/u07RKHjtg/3FphmbNXd6q82DFnXz/DOOR+yAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=X4ReeVQJ;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBF606A320;
	Thu, 19 Nov 2026 13:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=X4ReeVQJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795093274; bh=nMMu1SMXpnqRmd5iKVumjMZAYkX/1LCcfu6YZtgDlDE=;
	h=From:Message-ID:From;
	b=X4ReeVQJNB5tVV8psEHu1dhIZvGEHn1Ymqqd7pbnUV2qFwwlZogmjiZjhyZg6KyTw
	 5GxXxwxUOtFdcx/r6+CXE5An6YTSe2Pwz2SVP6yXXeDKJktpme/IGyipaA0WMDuAzd
	 Az1fnVj0RQpvb6Lc0EsXK1JONXVs1UqI6k52CgAs=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 32CB9C04AD;
	Thu, 19 Nov 2026 14:01:14 +0100 (CET)
Date: Thu, 19 Nov 2026 14:01:13 +0100
From: Willy Tarreau <w@1wt.eu>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <av7zGbqXizmXY4R-@1wt.eu>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
 <20261117152721.GC162713@unreal>
 <av7s5eV7Ws9Io3cE@1wt.eu>
 <20261119125947.GK162713@unreal>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119125947.GK162713@unreal>

On Thu, Nov 19, 2026 at 02:59:47PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 01:34:45PM +0100, Willy Tarreau wrote:
> > On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
> > > > > Since you're already making changes in that area, could you add a sentence
> > > > > asking reporters to provide the full dmesg stack trace?
> > > > 
> > > > In this doc, we already ask them not to [1] :)
> > > 
> > > This is really bad. You assumed they would trim the logs correctly, and I,
> > > as the recipient was expected to trust that they were accurate. They are not.
> > > 
> > > They trim everything, which makes these logs useless to me. As I said, they
> > > include AI-generated reports, cases with reproductions that are impossible
> > > with upstream code, and reports for completely out-of-tree code. Everything
> > > like that was visible in original dump stack and it is lost now.
> > > 
> > > > 
> > > > > Many AI-generated patches reduce it to one or two lines, which gives no
> > > > > indication of whether the report is genuine or fabricated. Early in the AI
> > > > > era, I saw some completely fabricated stack traces.
> > > > 
> > > > Is it still an issue?
> > > 
> > > I don't know about faked, but useless yes, especially in the cases where
> > > in-kernel API is involved.
> > 
> > The situation completely changed over the last year. LLMs that would
> > hallucinate bugs and dmesg in single-turn conversations have been
> > replaced with agents/harnesses calling shell commands and able to
> > capture contents without inventing them. I agree that we should ask
> > them to capture such dmesg which nowadays have no reason to be faked
> > anymore.
> 
> The meaning of "faked" has shifted. As you said, it previously referred to a
> completely imaginary call stack, now it refers to a custom module that abuses
> the in-kernel API. The latter is still "faked" because it cannot be done with
> the current code and unlikely will be possible in the future.

Ah OK we were indeed not speaking about the same cases.

Willy
