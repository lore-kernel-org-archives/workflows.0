Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB66435A83
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513492; cv=none; b=ItgRsTSJLBJlCf6roPQJ3o3VqBvIBaHK4shBezEsU8B4/oxfIhVChJJeaj3P5cPR+J8Lfc90Y1jjUWKgT+HS4/4Zhlk+l5RpARlW0GHutc/mIOUFO46RBwBRBo96G8K1o/TWY+PG9jnynypHiWeSI5zIxoHl3B2c7RVQdITZZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513492; c=relaxed/simple;
	bh=AKyd0M7PX0+Nq7kB/sdVqHTbpIOw2fdLhtT49aNZTt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KExRU8QlZhDR+W1AuYP88eI3GeJ7FsDRyiv0ooEwcnBBEKyOBJe3hEcx4xIhlEDW8nFqJXl16C6/usqQ7windHZh6LTSqcgVJ+EtvMQ3ZTelSBuNBEKvGKDAHQdQ0ue6E3dl0Kmo7toZoepm9CD3nSDPZUcxq6lD8RHlloWvHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Qvue5fYP; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Qvue5fYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1783513485;
	bh=mB6wN4edvu/uMC5EBoKZ1W1jvPayVvdoqYY59Yp1gfU=;
	h=From:Subject:Date:Message-ID;
	b=Qvue5fYPF2NUyiZvVww6fcXuGmIW5/Qx9g0Y0V8N/RxtBc1vkvey08bCrXw6tbp+2
	 W+lLCOplBz4acbGQpMNI3A4bCQSSQ6GiDgS0lWR5x5Uk6IKADX2QHYIYlzH1nQjs5Q
	 EvA/PcLgk/7YY4TSl26hApT4yp1g4DFz29ydH3Lo=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.32) with ESMTP
	id 6A4E41870000073A; Wed, 8 Jul 2026 20:24:41 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3139324456874
X-SMAIL-UIID: 4D8F1B5FC0FF458489170AE260210F19-20260708-202441-1
From: Hillf Danton <hdanton@sina.com>
To: Yuan Tan <yuantan098@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [RFC] VEGA: a syzbot-like workflow for LLM-found kernel bugs
Date: Wed,  8 Jul 2026 20:24:28 +0800
Message-ID: <20260708122429.461-1-hdanton@sina.com>
In-Reply-To: <20260708092247.4188498-1-yuantan098@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jul 08, 2026 at 02:22:47AM -0700, Yuan Tan wrote:
> Hi all,
> 
> We would like to ask for feedback on a proposed workflow for reporting Linux
> kernel bugs found by an LLM-assisted code auditing tool that we have
> been developing since earlier this year.
> 
> Since February, we have been developing an LLM-driven kernel code auditing
> tool called VEGA. It started as a side project, but the results became much
> substantial than we expected: VEGA has found hundreds of valid bugs in Linux
> kernel.
> 
> That immediately created a practical problem: we do not want to dump a large
> pile of bug reports onto mail lists and annoy the maintainers.
> 
Given the syzbot reports, I think less than 11 true vega reports a day will
not trigger a panic.
