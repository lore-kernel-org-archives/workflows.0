Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611464;
	b=POc3H3w+fi/kSkMpOULmhuqWNdWA/gBlEDCBHnt1Q/8YYON8ePkoVI4NPejnCmN/2QD9
	 c/rvJJnIeYsv0T2Y50Z9ktuYmlkIutOqBvq9tgF1REYDM4zj0BpbsXZS6XRL1AEW1ikQ0
	 IMmmV+2C5E+l8kLSkk3RIYjOYQEDl1YHvVV499oqk5W2d78cGxrURUuErq5U76fwUk4nf
	 FRO1fr28NMpHVMk30Jkiro6ueJ67HokXSLzmL+KPEFWXa9ZZtAN1WPq54RWjH7M7XXTmp
	 nQdmrbE9j5yhGc6Nw7vWVtppVt0YG1faUU859Vc3i51TzS14hQRdlxZGmscn6f0CNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611464;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=M9m+DYYVTEfjlMZl8Bvn+mQHXB+lKYN0EEAjTjy3d8U=;
	b=qhXBETjHBoX6jMtkZh0kTnBWcKGk++QhMPjl0ukb32yiBpxIwvCW0AOkIxYRSoZMsudl
	 1udpDLbiFBzmMbdFerHL1Mtq/WpdvgOXDzIvxNhsiJ7FNTZEiJVFG4ytJkGrD52OPgDRq
	 1qo1qPjSMfQjphSPVDJbAVz0iojYPRMB/jsO8ilpl6zt0Z6Zgbo69WFRuLv1j0CRj8UDW
	 YTMV31W2mMjigEoFrw+VLEOmCPtvfU1sLmthwWrWnYFSBLwxL7ZA7FpHanFBrU0E1u9zg
	 7s46fXwVQjATMtk7LdiV70RcvPFQ9XOu70rH6oFezcpGXfuPAUVHNmv5uMeX/WiA1lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpzjfdZW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E7606A31E;
	Wed, 25 Nov 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpzjfdZW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A021F000C4;
	Wed, 25 Nov 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611463;
	bh=M9m+DYYVTEfjlMZl8Bvn+mQHXB+lKYN0EEAjTjy3d8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IpzjfdZWB3dTPfW9QE2qvesQLxvPNzr3zhxEdno4gF7Y0bjuhvat3eADhro8KWjF9
	 l0NIob0SfhWWEl6TIig1+LRsGh2igG6VKhgw1SxGC3RWQInP5ZX19Fj5IgZ3TL7oUq
	 boHIHuHxg0N2NMNQP5XyygxuyTgbfOK1Z0P1HkUJgpUIlxvMAyMdT2pDpzzDD+dDlj
	 qsxFKH8dI72OSoNI/4h2YKO8A0HW1Iv9qVihJPwr3dErm7/B8yS/e9+hiLPS+x+put
	 4OyGhNvhCs3p8H83/bacaF334ihyCZo9sAC+JBJ9hAq7GANl6mTmDUjpJUX7I03dyj
	 KXLGoezNPpzfw==
Date: Wed, 25 Nov 2026 14:57:39 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261125125739.GA14811@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
 <20261117152721.GC162713@unreal>
 <av7s5eV7Ws9Io3cE@1wt.eu>
 <20261119125947.GK162713@unreal>
 <av7zGbqXizmXY4R-@1wt.eu>
 <20261122085022.GB14811@unreal>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261122085022.GB14811@unreal>

On Sun, Nov 22, 2026 at 10:50:22AM +0200, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 02:01:13PM +0100, Willy Tarreau wrote:
> > On Thu, Nov 19, 2026 at 02:59:47PM +0200, Leon Romanovsky wrote:
> > > On Thu, Nov 19, 2026 at 01:34:45PM +0100, Willy Tarreau wrote:
> > > > On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
> > > > > > > Since you're already making changes in that area, could you add a sentence
> > > > > > > asking reporters to provide the full dmesg stack trace?
> > > > > > 
> > > > > > In this doc, we already ask them not to [1] :)
> > > > > 
> > > > > This is really bad. You assumed they would trim the logs correctly, and I,
> > > > > as the recipient was expected to trust that they were accurate. They are not.
> > > > > 
> > > > > They trim everything, which makes these logs useless to me. As I said, they
> > > > > include AI-generated reports, cases with reproductions that are impossible
> > > > > with upstream code, and reports for completely out-of-tree code. Everything
> > > > > like that was visible in original dump stack and it is lost now.
> > > > > 
> > > > > > 
> > > > > > > Many AI-generated patches reduce it to one or two lines, which gives no
> > > > > > > indication of whether the report is genuine or fabricated. Early in the AI
> > > > > > > era, I saw some completely fabricated stack traces.
> > > > > > 
> > > > > > Is it still an issue?
> > > > > 
> > > > > I don't know about faked, but useless yes, especially in the cases where
> > > > > in-kernel API is involved.
> > > > 
> > > > The situation completely changed over the last year. LLMs that would
> > > > hallucinate bugs and dmesg in single-turn conversations have been
> > > > replaced with agents/harnesses calling shell commands and able to
> > > > capture contents without inventing them. I agree that we should ask
> > > > them to capture such dmesg which nowadays have no reason to be faked
> > > > anymore.
> > > 
> > > The meaning of "faked" has shifted. As you said, it previously referred to a
> > > completely imaginary call stack, now it refers to a custom module that abuses
> > > the in-kernel API. The latter is still "faked" because it cannot be done with
> > > the current code and unlikely will be possible in the future.
> > 
> > Ah OK we were indeed not speaking about the same cases.
> 
> Over the weekend, I realized that after this wave of incorrect and deliberate
> misuse of kernel APIs, we’ll see the next level - misuse of internal driver
> APIs as well.
> 
> I’m referring to the various EXPORT_SYMBOL()s in large, complex drivers
> such as mlx5, bnxt, and Intel’s drivers.
> 
> The idea that “let’s trim the dmesg stack” is going to be a disaster for
> everyone involved.

And here comes example of this:
https://lore.kernel.org/all/20261111105346.3220427-1-lee@jaeyeong.cc/
with very brief, trimmed version of log:
  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
  complete
  rsc_event_notifier

and here comes full log:
https://lore.kernel.org/all/20261122103855.51859-1-lee@jaeyeong.cc/
with completely faked situation in the driver:
[   13.847526] mlx5_dct_repro: loading out-of-tree module taints kernel.
[   13.915884] MLX5-DCT-REPRO: forcing DRAIN_DCT to fail with command interface down
[   13.916736] MLX5-DCT-REPRO: destroy failed as required: -67
[   13.916817] MLX5-DCT-REPRO: failed destroy retained DCT ffff88800b112c58 in dct_xa
[   13.916862] MLX5-DCT-REPRO: mimicking DEVX create unwind kfree(ffff88800b112c00)
[   13.916924] MLX5-DCT-REPRO: delivering DCT_DRAINED event through actual notifier

mlx5_dct_repro is an out-of-tree module that has nothing in common with the
real hardware device or the flows it handles.

Thanks

> 
> Thanks
> 
> > 
> > Willy
> 
