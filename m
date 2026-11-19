Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091696;
	b=lvMj7fq+vi0nLCFRjMmr9JeMLfFxAwZvhtfOhw8CiDv/95pLLbeembLyWwxlk43tPrbl
	 EehwyJxoBGHZvHTYgjSF16CLYFq7mVHeW6dS7kH1vxFWBdGoZk+zrbZUsgEYTFhtPxzIl
	 sTFG9ZGtwsgsTQ1nis6Pbo7b4u2BOIhUAZ/JWR9FV4bVa30PLaPGgARbPXGE4kYzS0phx
	 6GsBnxdJznmXTNB9qqyo2JotB7U10bYPGiDLqZQPY3ZQC9qlXAydeewQsAdwveEerIzl3
	 14vaYudtyQgew1X1PqbM9J1Di8CAR9EG6YcGhMZfrhRkIdjp7hapWxXXEEqVi/lP34w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091696;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7s4XTz+4AV9iKI/UFqt2bu0ChWlIJUUvN/YPh7p0cFw=;
	b=oHjVEiUqUrnma9fI18l1UBpTn6nHagMzaq7XTJlTTVClUnKuvXfWMIl+MBvw3tXJmgW4
	 C/qBbBKZj+untdc/lTQBbpWZDvEZQnK00c34nNFZjk5i9aBVXs/hmjSe+8SiOV208gsgn
	 dRm0tWk3HdoAJgT0EoOwIbu8185t1XOZvAf0Fit0rgPKNUUOuCtEQO4RGemurKyrY7k2N
	 4+fcy/+92LjWH5KOWfq3M93OqLlXRCFB0VbWoD9ZxPjISFfphuW8E68xROUIZkwYmWf1Y
	 wYwBGRkzdt/wOPKwCfRO2o0C0vukZu82NussACOEdGcoZUGiUDOF0wF81TFMzpdEGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=C4EwaBsB;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB906606A32C;
	Thu, 19 Nov 2026 12:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB906606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=C4EwaBsB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795091685; bh=7s4XTz+4AV9iKI/UFqt2bu0ChWlIJUUvN/YPh7p0cFw=;
	h=From:Message-ID:From;
	b=C4EwaBsBYM51LVu9WAfTjrzEwH8wo9VnVw7+Q+5rqI1u4dVlGubdridrDdU/VvjRH
	 j0OlvyzREuMLYJJIp+uMD0oEr3OUcsJ/KD2TBnjYachQ2BnNKTUPETxiQToMe9in0m
	 8mza/Zssf2oQ4jYCvCh4Gv+ByI7c4exAeDHtf+Ck=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 9DE6CC04AD;
	Thu, 19 Nov 2026 13:34:45 +0100 (CET)
Date: Thu, 19 Nov 2026 13:34:45 +0100
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
Message-ID: <av7s5eV7Ws9Io3cE@1wt.eu>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
 <20261117152721.GC162713@unreal>
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
In-Reply-To: <20261117152721.GC162713@unreal>

On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
> > > Since you're already making changes in that area, could you add a sentence
> > > asking reporters to provide the full dmesg stack trace?
> > 
> > In this doc, we already ask them not to [1] :)
> 
> This is really bad. You assumed they would trim the logs correctly, and I,
> as the recipient was expected to trust that they were accurate. They are not.
> 
> They trim everything, which makes these logs useless to me. As I said, they
> include AI-generated reports, cases with reproductions that are impossible
> with upstream code, and reports for completely out-of-tree code. Everything
> like that was visible in original dump stack and it is lost now.
> 
> > 
> > > Many AI-generated patches reduce it to one or two lines, which gives no
> > > indication of whether the report is genuine or fabricated. Early in the AI
> > > era, I saw some completely fabricated stack traces.
> > 
> > Is it still an issue?
> 
> I don't know about faked, but useless yes, especially in the cases where
> in-kernel API is involved.

The situation completely changed over the last year. LLMs that would
hallucinate bugs and dmesg in single-turn conversations have been
replaced with agents/harnesses calling shell commands and able to
capture contents without inventing them. I agree that we should ask
them to capture such dmesg which nowadays have no reason to be faked
anymore.

Willy
