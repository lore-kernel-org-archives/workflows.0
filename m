Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E58395ADC
	for <workflows@vger.kernel.org>; Mon,  3 Aug 2026 19:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786658; cv=pass; b=K14VAh6tvBVkuGPzYp2sN6Dm/ukGXFbwHFoiz/qKE5o355l5/Y0O/Oh5G9GvzH6LW3pyOeRUIvpI9dHvTTvx9E3S7g+rAQ2j+MUFQXmYP9FsRiTSqPsKg0WezAQdOxyVNuwiPJfX65XbE9q+bv/0YY2DsjvMzvaod5GLYcdfB7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786658; c=relaxed/simple;
	bh=NAl0gpMh3fGqq7FFUdcYuO3JDrqNo98qbzn6J7MYhtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAsfbnhqHxRJOLK1VCSyMuYOO6+QqQq501J2DuO0dlhOHfoN2gkDqML8WEViwhC4z5OpmlrsW5rSqwnBywmYS0M0gIykoW81tLzCbojBxqf+WD37PbDrHrLjEq6DfDyPWk6cj4OCSAG3hCK6IJOIoSf0X0RhccijyWlrO/J15AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jz4cCvu+; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jz4cCvu+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf49dc28ccso4869305ad.0
        for <workflows@vger.kernel.org>; Mon, 03 Aug 2026 12:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785786657; cv=none;
        d=google.com; s=arc-20260327;
        b=Ea2VV5jTt0nF06HFppDfoE/E5/ieh/DB/WBSrOgKSuBn6fg3O9zL7W4PSQJp0JIom0
         FFyPUYauMS1rjOKRYDkUCPxfGwU5j5k98YdaReF24hmnU0IHdUtldr0mFk5Do4Ctzx6h
         k7I9BP3q0KatU/4GmHPhu0Ab/RXT0lVQ/laxAfCZd5JNTuIGnob6CAf1g2kLR/7OVfOY
         zRgI/aBmVfdaUYffwO6suuIV8BvUj8SqO5WHVH+K+hE7Uck+Qqo2BSOH+pt2AkvZ78dV
         PfIj7FCTxqllcaE1Qr3pq/bXcTcCbmxP0r5JvV6sWGMSVQntI6o56B8Dis2WiU4pHg/3
         Ov8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04IXeM3TWIa/z5driuY1+bqLHJxfFjLbYEQUo7kB6Mk=;
        fh=6xgVNqJ/ZQj/hqv4o/Ay5GTjfCswA8AApdrxCXrPewQ=;
        b=bf1wpVA44rOPDCqu2/aDLmsLS9FIYEJ1tYups0EEA3fRPpCIRnRN1fhKziVuGGU0vc
         5OvgtRVSmHt/5Glq+FjWj2xoBcAnLVZO+6HldDSmIvj5/wmq0x9e22IaZHlZOI2lFOSl
         fuHffDR9VxrcCA/j5vtH1hIGoSr+67Ncf2U8PK3F2khAQ4WUMKZ4RdNVbAy/ktsI6XIj
         XuOOVX/J0oTdmXvckc6EEuOZMkJgmA2Qu0Zqo7W2kM41GS2Otx2vC4tY1A6S38cwBHG5
         q2qZh8lw+QgyTp1mitZxlxA9tWw531tl98dAVA+udb2CVjBVUfgoVsMZC5W9DfgwPLVi
         7n0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786657; x=1786391457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04IXeM3TWIa/z5driuY1+bqLHJxfFjLbYEQUo7kB6Mk=;
        b=jz4cCvu+f+0uTwMIc4FggojjJdIN5B4dIhu8K0o+E4aNO3cxYwT4ozUX2oDjpfv5FG
         IbTD7iHhuU94FLG/1W4t1rxrJTok16s7inovXikGga/QEit/6QtlYo5Xfs0gCGDz9eCv
         vLhnoAHgu3tvLf1vEoHvKMQmXW+lRmVtma73V3D82/tnP05GG1RMwCAfWFxVCROvGTLP
         5g5oXVBY3EDpJ5calSamuD2F6kQYHlRM4shbE91L4rzTXy+CRC6jYAadqq1M+p8r3/ua
         sAPxVqFBzVgnLU3Oo+n7L5/0awH3MabkaJFSkrur8gFqpr6Kv/AuPrI7asBXksxGtJNv
         yKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786657; x=1786391457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04IXeM3TWIa/z5driuY1+bqLHJxfFjLbYEQUo7kB6Mk=;
        b=r7AbAsWN0PzAR88MldFRwx/u80lEIEvXmp0PWhC3vOSCWeUxqDy8hMR4VfHInnB3Rr
         4w9NAb0KmH9+QLra8PvwjBXxwFv72mCEBFkaac/ocuUOjfhi6axVCL8g2vj43BRe5bzC
         8PEvqYdLIFEBzp26OWboSNRwAzWt/YMX9iXi6DOWyMQGb+wPtEPcLYsvJbnMUH3OFs42
         F+6+Q5q91npmis6FHsajsFQTDgqpdKsWNCKBGTRIYwPoS367v1aAALKkcX4tKq0P8QEG
         47IpvPTdNu1bkV//ENuO+2QG9GDo5VYZE9K+LQsdgLbgZdMPnXhWOu5+pM0wP+BTPDPj
         jqWw==
X-Forwarded-Encrypted: i=1; AHgh+RqJuBZbOGv1NefmfH3pIm48PDQbG5a+ZpUCC/yNHeEuPbvSxOkMsSHEcW4SJUOzTkGgPg4SJD6dSdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMEBzWgC1/lIXxlqm+mcsnHhrdqBT3YELeq4tRABRlLs74+v2
	qYKKToWkVPyeoVf9hsZ8maeVFaHBSrx1dkzKlQ3ZDxN8mk0wslZumhZa4itlXzoKHVHq09XX2+b
	ootYOG8RNIjsbnOc67IRjqpb7HYSNVHE=
X-Gm-Gg: AR+sD10QcRnKjuBAQbRBHbxGuTs6+RY4jLWNFyRegf6nrUmHSP0PM+zWP/xaC8VqCys
	p7mz19rocL12KJN4TqIUj+9RN9RdKECOkH1ywcfR9hU4uAq5cSdPgHrF5YKjAgQZn5y3TM6l2Ck
	HAvSfiwDCF98a2AwSw3QkFvQN+BcOtgVZW0SAfGhK3FL9/rfaU29ukgU3ZBIbN5sPm7Ck6jyHB/
	xFDWc+GZeuB7l+qf/TPbMI7XfyZ9EtMlNKgW7iM6D9D+p+vEZyYyY03llFGuFhLCRRvMtD0lWLf
	Y3if4UJruqSdCmP9+OZ8c+4I1jPqZDTFzEBoDyuX0CtyulIar+7p5BBPHV3wY69kDni+5FDyVq2
	BdEIsV5I1mER7sAqxMSww5zikIRhzuwAKVxbsjkQKixiElnSQDivZVK+6izU7
X-Received: by 2002:a17:902:dad1:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d05296eb89mr155273295ad.4.1785786656839; Mon, 03 Aug 2026
 12:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87qzkuahlr.fsf@trenco.lwn.net> <87ldanxcbk.fsf@trenco.lwn.net>
In-Reply-To: <87ldanxcbk.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 21:50:43 +0200
X-Gm-Features: AUfX_mzK3T690yNL9Wu-KrH2qZ6GryIUKTwv7JStnYmA9wJqpYsBEodOALrt6EM
Message-ID: <CANiq72mW8P60tiGD_3TT0ZHro+QPpDqXtccc95ghRBrZ00bX2A@mail.gmail.com>
Subject: Re: [tech-board] [PATCH] coding-assistants: simplify attribution
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Sasha Levin <sashal@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:42=E2=80=AFPM Jonathan Corbet via
groups.linuxfoundation.org <corbet=3Dlwn.net@groups.linuxfoundation.org>
wrote:
>
> So I was not overwhelmed by responses :)  I'm going to take silence for
> assent in this case and send the patch through.

On the TAB side, we didn't meet since it was sent, but yeah, it
doesn't look like there are strong opinions against this.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Personally, I think it is fine either way (e.g. someone could argue
the advertising could help open models and harnesses etc.).

The patch removes the "Where:", not sure if that is intentional.

Thanks!

Cheers,
Miguel
