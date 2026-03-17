Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76753E3C5D;
	Tue, 17 Mar 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759959; cv=none; b=fe3WFFrS/YilEAZFhxI6Glnwu/efdlcivUczawJA0EOo+cSyj9xxDZLRxCDB+hNCPPTIYNQa+gJE+IKPME8XsM9S+dt5X3onxewBEkefYbfvkZaHp1iRtQPIR547rBS5dZ6gSJBzomtcbbukpaZyXCl9yu/w+UkiT2pLfvHKZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759959; c=relaxed/simple;
	bh=MX3WCxaiQASDTLsC5NMpwSqJSWncFo8CQIqLXa1xBBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ms8CMSS1IIWfAxFQ93XpphH+PSsqdEAeYM/H/3+tiWi4G/ksYf6rYCV0slNr3DyDS7xG9GK/xbtb3WxO8qhdECzgfNwKR7Udum3QZhASwwoi8u1VjxcMdEKc1y/GMa+DQ8tF9G11ow7KF8ZNpH6QmT1KPBv3JYxRLxQclvIkYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ETdCAe3Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ETdCAe3Y"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3ACAC40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759958; bh=MX3WCxaiQASDTLsC5NMpwSqJSWncFo8CQIqLXa1xBBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ETdCAe3YHmGKwtQaLgQmW4vvr1BGvgYX3GD9dHDozwKTddhpkPyMYrp0PRR9r44hl
	 KK7eD2X3wTh8XajiEh3Q9zKvsfQ6X3ppbK2+G9R9tAhmzzV5cklujCYJNtsh6noKWI
	 4x1VdmDqIz8yBKjNi8z7t9yFXO8zmHr3GsTe+T82TPbv/cMhpHyfJIiARkIHBjy7WM
	 sK/+gxUp1psm82v7m8UUkBWS3pTAwc0hBGeT4rJTYeA+oiVENH1AMjmVtFiOpszVoX
	 mT0GTtvpzskpnAZsO/cF1qAhz9I3rETR4Ztlt2F/3WFm7Tjr0jzzK42kSnChUw/tF1
	 CBXhnq/iOPh1Q==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3ACAC40C7C;
	Tue, 17 Mar 2026 15:05:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 4/4] workflow: process/changes.rst: sort list
In-Reply-To: <20260312002607.191358-2-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260312002607.191358-2-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:05:57 -0600
Message-ID: <874imecx7u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions.
> Sorting both lists the same way makes side-by-side comparisons a simple task.
>
> sort output alphabetically

Need I say that providing identical changelogs for two different patches
is a sign that something isn't quite right?

The change itself looks fine.

Thanks,

jon
